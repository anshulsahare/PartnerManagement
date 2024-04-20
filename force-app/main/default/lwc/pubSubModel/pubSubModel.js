import { publish } from "lightning/messageService";

//store is an object
const store = {};

/**
 * Subscribe a callback for event
 * @param {string} eventname - Name of the event to listen for.
 * @param {function} callback - Function to invoke when said event is fired
 */
 
//subscribe is a method which take an event & callback
const subscribe = (eventName, callback) =>{
    if(!store[eventName]){
        store[eventName] = new Set();
    }
    store[eventName].add(callback);
};

/**
 * unsubsribe a cllback for event
 * @param {string} eventname - Name of the event to unsubscribe from.
 * @param {function} callback - function to unsubscribe. 
 */
 const unsubsribe = (eventName, callback) =>{
    if(store[eventName]){
        store[eventName].delete(callback)
    }
 };

 /**
  * Publish an event to listner
  * @param {string} eventName - Name of the event to publish
  * @param {*} payload - payload of the event to publish
  */

  const publlish = (eventName, payload) =>{
    if(store[eventName]){
        store[eventName].forEach(callback => {
           try{
            callback(payload)
           }
           catch(error){
            console.error(error);
           }
        });
    }
  };

  export default{
    subscribe,
    unsubsribe,
    publish
  };