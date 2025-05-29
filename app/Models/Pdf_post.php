<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pdf_post extends Model
{
    protected $fillable = ['title', 'photo', 'pdf_file', 'user_id'];
    // app/Models/Pdf_post.php 
    public function user()
    {        
        return $this->belongsTo(User::class);        
    }
}
