    <div class="flex flex-row mx-32 gap-2 my-4">
        <h1 class="font-semibold text-black-color">Produit :</h1>
        <h2 class="font-medium text-grey-color">{{type}}</h2>
    </div>
    <div class="flex md:flex-row flex-col mx-6 md:mx-20 gap-4 content-center md:justify-start justify-center items-center md:items-start content-center">
        <div class="flex flex-col max-w-48 gap-4">
            <select class="bg-white-color py-2 px-3 border-solid border-2 border-black-color" name="sexe" id="sexe">
                <option value="" disabled selected>Choisissez le sexe</option>
                <option value="homme">Homme</option>
                <option value="femme">Femme</option>
            </select>
            <select class="bg-white-color py-2 px-3 border-solid border-2 border-black-color" name="color" id="color">
                <option value="" disabled selected>Choisissez la couleur</option>
                <option value="rouge">Rouge</option>
                <option value="bleu">Bleu</option>
                <option value="vert">Vert</option>
                <option value="jaune">Jaune</option>
            </select>
            <select class="bg-white-color py-2 px-3 border-solid border-2 border-black-color" name="size" id="size">
                <option value="" disabled selected>Choisissez la taille</option>
                <option value="s">S</option>
                <option value="m">M</option>
                <option value="l">L</option>
                <option value="xl">XL</option>
                <option value="xl">XXXL (Pour Monsieur Poulbière)</option>
            </select>
        </div>
        <section class="sm:flex-row static grid md:grid-cols-2 lg:grid-cols-3 grid-cols-1 gap-4 content-center" id="type">
        </section>
    </div>