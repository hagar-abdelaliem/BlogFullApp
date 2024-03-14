<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Abbasudo\Purity\Traits\Filterable;

class Category extends Model
{
    use HasFactory, Filterable;

    protected $fillable = ['name', 'image', 'colorCode'];

    public function articles(): HasMany
    {
        return $this->hasMany(Article::class);
    }
}
