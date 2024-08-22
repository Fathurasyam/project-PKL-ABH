var map = L.map('mapid').setView([1.074698, 104.039306], 12);

var petaLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

var redIcon = L.icon({
    iconUrl: 'images/icon1.png',
    iconSize: [41, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34]
});

var blueIcon = L.icon({
    iconUrl: 'images/shadow1.png',
    iconSize: [41, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34]
});

function addMarkers(data, layerGroup, icon) {
    data.forEach(function(marker) {
        var popupContent = marker.info; 
        
        L.marker([marker.latitude, marker.longitude], { icon: icon })
            .bindPopup(popupContent)
            .addTo(layerGroup);
    });
}

var wtpMarkers = L.layerGroup();
var kppMarkers = L.layerGroup();

fetch('config.php?layer=wtp')
    .then(response => response.json())
    .then(data => addMarkers(data, wtpMarkers, redIcon))
    .catch(error => console.error('Error fetching WTP markers:', error));

fetch('config.php?layer=kpp')
    .then(response => response.json())
    .then(data => addMarkers(data, kppMarkers, blueIcon))
    .catch(error => console.error('Error fetching KPP markers:', error));

var geoJsonLayer = L.layerGroup().addTo(map);

fetch('data/map.geojson')
    .then(response => response.json())
    .then(data => {
        L.geoJson(data, {
            style: function (feature) {
                return {
                    color: 'red',
                    fillColor: 'blue',
                    weight: 2,
                    opacity: 1.0
                };
            },
            onEachFeature: function (feature, layer) {
                var popupContent = "<strong>WADUK</strong><br>";
                for (var key in feature.properties) {
                    if (key !== 'image') {
                        popupContent += key + ": " + feature.properties[key] + "<br>";
                    }
                }
                
                if (feature.properties.image) {
                    popupContent += '<img src="' + feature.properties.image + '" style="width:200px;height:auto;margin-top:10px;cursor:pointer;" onclick="openModal(this.src)">';
                }
                
                layer.bindPopup(popupContent);
            }
        }).addTo(geoJsonLayer);
    })
    .catch(error => console.error('Error fetching GeoJSON:', error));

function openModal(src) {
    var modal = document.getElementById("imageModal");
    var modalImg = document.getElementById("modalImage");
    modal.style.display = "block";
    modalImg.src = src;
}

function closeModal() {
    var modal = document.getElementById("imageModal");
    modal.style.display = "none";
}

window.onclick = function(event) {
    var modal = document.getElementById("imageModal");
    if (event.target === modal) {
        closeModal();
    }
}

window.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        closeModal();
    }
});

var baseLayers = {
    "Peta": petaLayer
};

var overlayLayers = {
    "Lokasi WTP": wtpMarkers,
    "Lokasi KPP": kppMarkers,
    "GeoJSON Layer": geoJsonLayer
};

L.control.layers(baseLayers, overlayLayers).addTo(map);