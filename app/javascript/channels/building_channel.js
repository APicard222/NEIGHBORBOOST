import consumer from "./consumer";

const initBuildingCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.buildingId;
console.log("coucou,",id)
    consumer.subscriptions.create({ channel: "BuildingChannel", id: id }, {
      received(data) {
        console.log(data)
        messagesContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

export { initBuildingCable };
