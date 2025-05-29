<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Role extends Model
{
    // Optional: If your roles table doesn't use timestamps
    public $timestamps = false;

    // Optional: Explicitly define the table name
    protected $table = 'roles';

    // Optional: Define fillable fields if you plan to mass assign
    protected $fillable = ['name'];

    // Optional: If you want to define relationship with users
    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }

}
