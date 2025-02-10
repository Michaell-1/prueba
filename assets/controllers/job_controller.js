import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    search() {
        let title = document.getElementById("searchTitle").value;
        let contract = document.getElementById("searchContract").value;

        fetch(`/job-offers/search?title=${title}&contractType=${contract}`)
            .then(response => response.json())
            .then(data => {
                let jobOffersDiv = document.getElementById("jobOffers");
                jobOffersDiv.innerHTML = "";

                data.forEach(job => {
                    let jobDiv = document.createElement("div");
                    jobDiv.innerHTML = `
                        <h3>${job.title}</h3>
                        <p>Contrato: ${job.contractType}</p>
                        <p>Cantón: ${job.canton}</p>
                        <p>Parroquia: ${job.parish}</p>
                    `;
                    jobOffersDiv.appendChild(jobDiv);
                });
            });
    }
}
