import { LightningElement} from 'lwc'

export default class Map extends LightningElement {
   
    mapMarkers; 
    zoomLevel;
    listView;

connectedCallback() {
  this.mapMarkers = [{
    location: {
      City: "Wrocław", 
      Country: "Poland", 
      Street: "Jaworska 11"
    },
    title: "Wrocław Office",
    icon: "standard:account"
    
  }, 
  {
    location: {
      City: "Warsaw", 
      Country: "Poland", 
      Street: "Prosta 20"
    },
    title: "Warsaw Office",
    icon: "standard:account"
    
  },
  {
    location: {
      City: "Kraków", 
      Country: "Poland", 
      Street: "Dekerta 24"
    },
    title: "Kraków Office",
    icon: "standard:account"
    
  },
];

    //zoom can be 1-22
        this.zoomLevel = 6;
        this.listView = "visible"
}
}