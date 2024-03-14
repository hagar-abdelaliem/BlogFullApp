<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TagController extends Controller
{
    public function index()
    {
        $tags = Tag::all();

        return response()->json(['tags' => $tags]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:tags|max:255',
        ]);

        $tag = Tag::create([
            'name' => $request->name,
        ]);

        return response()->json(['tag' => $tag, 'message' => 'Tag created successfully']);
    }

    public function show(Tag $tag)
    {
        return response()->json(['tag' => $tag]);
    }

    public function update(Request $request, Tag $tag)
    {
        $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
                Rule::unique('tags')->ignore($tag->id),
            ],
        ]);

        $tag->update(['name' => $request->name]);

        return response()->json(['tag' => $tag, 'message' => 'Tag updated successfully']);
    }

    public function destroy(Tag $tag)
    {
        $tag->delete();

        return response()->json(['message' => 'Tag deleted successfully']);
    }

    public function articles(Tag $tag)
    {
        $articles = $tag->articles;

        return response()->json(['articles' => $articles]);
    }
}

