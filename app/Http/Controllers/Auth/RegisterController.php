<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Role;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'profile' => ['required'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
         // Upload profile image
        $file_name = time().'.'.$data['profile']->extension();
        $upload = $data['profile']->move(public_path('images/profile/'), $file_name);

        if ($upload) {
            $profile = "/images/profile/" . $file_name;
        }

        // ✅ Get role ID from roles table BEFORE using it
        // fix data add
        $role_id = Role::where('name', 'user')->value('id');

        if (!$role_id) {
            abort(500, "Role 'user' not found in roles table.");
        }

        // ✅ Now use the variable
        return User::create([
            'name' => $data['name'],
            'profile' => $profile,
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'role_id' => $role_id,
        ]);
    }
}
