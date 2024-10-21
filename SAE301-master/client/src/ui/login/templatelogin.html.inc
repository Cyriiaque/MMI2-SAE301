<div class="bg-gray-100 flex items-center justify-center min-h-screen z-0">
    <div class="bg-white-color p-8 rounded-lg shadow-lg w-full max-w-md flex flex-col items-center gap-4">
        <div class="w-full">
            <label for="login" class="block text-black-color font-semibold mt-2">Email</label>
            <input type="text" id="login" placeholder="Saisir votre e-mail" class="w-full px-4 py-2 border border-light-grey-color rounded-lg focus:outline-none focus:ring-2 focus:ring-black-color">
        </div>
        <div class="w-full">
            <label for="mdp" class="block text-black-color font-semibold mt-2">Mot de passe</label>
            <input type="password" id="mdp" placeholder="Saisir votre mot de passe" class="w-full px-4 py-2 border border-light-grey-color rounded-lg focus:outline-none focus:ring-2 focus:ring-black-color">
        </div>
        <button class="bg-black-color text-white-color rounded-full py-2 px-6">Se connecter</button>
        <div class="text-center">
            <p class="text-gray-500">Don't have an account? <a href="#" onclick="loadSignTemplate()" class="text-black-color hover:text-grey-color">Sign up</a></p>
        </div>
    </div>
</div>