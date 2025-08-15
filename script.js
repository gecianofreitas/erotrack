var map = L.map('map').setView([-23.5505, -46.6333], 13);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

let arvores = [];

function atualizarEstatisticas() {
    document.getElementById("total-arvores").textContent = arvores.length;
    document.getElementById("atencao-arvores").textContent =
        arvores.filter(a => a.condicao !== "Saudável").length;
}

document.getElementById("form-arvore").addEventListener("submit", function(e) {
    e.preventDefault();

    let nome = document.getElementById("nome").value;
    let coords = document.getElementById("coordenadas").value.split(",");
    let condicao = document.getElementById("condicao").value;

    let lat = parseFloat(coords[0].trim());
    let lng = parseFloat(coords[1].trim());

    if (isNaN(lat) || isNaN(lng)) {
        alert("Coordenadas inválidas!");
        return;
    }

    
    let arvore = { nome, lat, lng, condicao };
    arvores.push(arvore);

    
    L.marker([lat, lng])
        .addTo(map)
        .bindPopup(`<b>${nome}</b><br>${condicao}`);

    atualizarEstatisticas();

    
    document.getElementById("form-arvore").reset();
});
