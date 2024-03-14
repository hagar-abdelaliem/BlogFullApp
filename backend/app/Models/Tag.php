<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Abbasudo\Purity\Traits\Filterable;

class Tag extends Model
{
    use HasFactory, Filterable;

    protected $fillable = ['name'];

    public function articles(): BelongsToMany
    {
        return $this->belongsToMany(Article::class);
    }
}
