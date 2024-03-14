<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();

        return response()->json(['categories' => $categories]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:categories|max:255',
        ]);

        $category = Category::create([
            'name' => $request->name,
            'image' => $request->image,
            'colorCode' => $request->colorCode,
        ]);

        return response()->json(['category' => $category, 'message' => 'Category created successfully']);
    }

    public function show(Category $category)
    {
        return response()->json(['category' => $category]);
    }

    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
            ],
        ]);

        $category->update(['name' => $request->name, 'image' => $request->image, 'colorCode'=> $request->colorCode]);

        return response()->json(['category' => $category, 'message' => 'Category updated successfully']);
    }

    public function destroy(Category $category)
    {
        //$categories->articles()->delete();

        $category->delete();

        return response()->json(['message' => 'Category deleted successfully']);
    }

    public function articles(Category $category)
    {
        $articles = $category->articles;

        return response()->json(['articles' => $articles]);
    }
}
