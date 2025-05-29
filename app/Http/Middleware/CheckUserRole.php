<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class CheckUserRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $role): Response
    {
        $roleNames = explode('|', $roles); // Example: ['Super Admin', 'Admin']

        $user = Auth::user();

        if ($user && $user->role && in_array($user->role->name, $roleNames)) {
            return $next($request);
        }

        return redirect('/');
    }
}
