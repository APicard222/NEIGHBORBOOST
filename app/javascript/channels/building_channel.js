import consumer from "./consumer";

const initBuildingCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.buildingId;

    consumer.subscriptions.create({ channel: "BuildingChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

export { initBuildingCable };
