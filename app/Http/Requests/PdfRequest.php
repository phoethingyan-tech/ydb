<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\File;

class PdfRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title'     => 'required|string|max:255',
            'photo'     => ['required', File::image()->max(3 * 1024)], // max size in KB (e.g., 3MB)
            'pdf_file'  => ['required', File::types(['pdf'])->max(12 * 1024)], // e.g., max 12MB
            'user_id'   => 'required|exists:users,id',           
        ];
    }
}
