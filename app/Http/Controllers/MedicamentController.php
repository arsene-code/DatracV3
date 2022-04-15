<?php

namespace App\Http\Controllers;

use App\Models\Etablissements;
use App\Models\Medicament;
use Illuminate\Http\Request;

class MedicamentController extends Controller
{
    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function dashSuperAdminMedicament(Request $request)
    {

        $page_title = "Etablissements";

        $actes = Medicament::all();

        return view('backend.superadmin.dashSuperAdminMedicament', compact('page_title', 'actes'));

    }
}
