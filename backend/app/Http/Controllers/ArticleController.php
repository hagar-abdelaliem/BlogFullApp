<?php

namespace App\Http\Controllers;

use App\Models\Article;
use App\Models\Category;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    public function index(Request $request)
    {
        $articles = Article::with('tags', 'user', 'category')->filter()->get();

        return response()->json(['articles' => $articles]);
    }
}
