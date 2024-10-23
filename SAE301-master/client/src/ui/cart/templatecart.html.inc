<h1 class="text-black-color font-semibold text-2xl py-4 pl-32 md:pl-64">Panier</h1>
<div class="flex flex-col md:flex-row md:justify-around md:items-start justify-center items-center">
    <section id="panier" class="border-solid border-2 border-light-grey-color m-2 p-2 flex flex-col gap-4 max-w-4xl"></section>
    <div class="md:max-w-60 w-3/5 bg-light-grey-color py-6 px-10 flex flex-col gap-4 m-2">
        <h2 class="text-2xl font-semibold">Récapitulatif</h2>
        <h3>As-tu un code promo</h3>
        <input type="text" class="bg-light-grey-color border-solid border-grey-color border-2 py-2 px-2 rounded-lg" placeholder="Saisie ton code promo">
        <div class="flex flex-row justify-between items-center text-grey-color border-solid border-grey-color border-b-2 py-2">
            <h3>Total Panier</h3>
            <h3 id="total"></h3>
        </div>
        <div class="flex flex-row justify-between items-center text-grey-color border-solid border-grey-color border-b-2 py-2">
            <h3>Code promo</h3>
            <h3 id="codepromo">-<span id="code-value">4.99</span>€</h3>
        </div>
        <div class="flex flex-row justify-between items-center text-black-color border-solid border-black-color border-b-2 py-2 pt-10">
            <h3>Total Panier</h3>
            <h3 id="totalPromo"></h3>
        </div>
        <button class="bg-black-color text-white-color rounded-full py-3 px-6">Paiement</button>
    </div>
</div>