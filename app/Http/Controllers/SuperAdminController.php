<?php

namespace App\Http\Controllers;

use App\User;
use App\Models\Actes;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SuperAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashSuperAdmin(Request $request)
    {

    	$page_title = "Tableau de bord";

    	$superadmin_id = Auth::user()->id;
    	$superadmin = User::find($superadmin_id);

	    return view('backend.superadmin.dashSuperAdmin', compact('page_title'));

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dashSuperAdminActes(Request $request)
    {

    	$page_title = "Nos Actes";

    	$actes = Actes::all();

        return view('backend.superadmin.dashSuperAdminActes', compact('page_title', 'actes'));

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function newActeSuperAdmin(Request $request)
    {

        $new_acte = new Actes();

    	// Get new data
        $new_acte->quotation = $request->input('quotation');
        $new_acte->libelle = $request->input('libelle');

        if($new_acte->save()){

            // Redirection
            return redirect()->back()->with('success', 'Nouvel acte crée avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de créer cet acte !');

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showActeSuperAdmin(Request $request, $id)
    {

    	$page_title = "Détails Acte";

    	$acte = Actes::find($id);

        return view('backend.superadmin.showActeSuperAdmin', compact('acte', 'page_title'));

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function editActeSuperAdmin(Request $request, $id)
    {

    	$page_title = "Editer Thème";

    	$acte = Actes::find($id);

        return view('backend.superadmin.editActeSuperAdmin', compact('acte', 'page_title'));

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function updateThemesuperadmin(Request $request)
    {

    	$acte_id = $request->input('acte_id');
    	$new_acte = Actes::find($acte_id);

    	// Get new data
        $new_acte->quotation = $request->input('quotation');
        $new_acte->libelle = $request->input('libelle');

        if($new_acte->save()){

            // Redirection
            return redirect()->back()->with('success', 'Acte modifié avec succès !');
        }

        // Redirection
        return redirect()->back()->with('failed', 'Impossible de modifier cet acte !');

    }














}
