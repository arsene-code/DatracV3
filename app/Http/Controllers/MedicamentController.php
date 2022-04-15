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

    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function updateMedicamentSuperAdmin(Request $request)
    {
        $ass_id = $request->input('id');
        $new_ass = Medicament::where('id', $ass_id)->first();
        $filename = '';

        // Get new data
        $new_ass->nom_commercial = $request->input('nm');
        $new_ass->dci = $request->input('dci');
        $new_ass->taux_rem = $request->input('tr');
        $new_ass->posologie = $request->input('poso');
        $new_ass->effet_indesir = $request->input('effet');
        $new_ass->indication = $request->input('indi');
        $new_ass->contre_indi = $request->input('ci');
        $new_ass->grossesse_allait = $request->input('grosse');


        if($new_ass->save()){
            // Redirection
            return redirect()->back()->with('success', 'Acte modifié avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de modifier cet acte !');

    }


    /**
     * Display a listing of the resource.
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function newMedicamentSuperAdmin(Request $request)
    {
        $new_ass = new Medicament();
        $filename = '';

        // Get new data
        $new_ass->nom_commercial = $request->input('nm');
        $new_ass->dci = $request->input('dci');
        $new_ass->taux_rem = $request->input('tr');
        $new_ass->posologie = $request->input('poso');
        $new_ass->effet_indesir = $request->input('effet');
        $new_ass->indication = $request->input('indi');
        $new_ass->contre_indi = $request->input('ci');
        $new_ass->grossesse_allait = $request->input('grosse');


        if($new_ass->save()){
            // Redirection
            return redirect()->back()->with('success', 'Acte modifié avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de modifier cet acte !');

    }
}
