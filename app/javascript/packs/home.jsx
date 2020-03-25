import React from 'react'
import ReactDOM from 'react-dom'
import CustomerDetails from '../components/homePage/customerDetails'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render( <CustomerDetails />, document.body.appendChild(document.createElement('div')))
});
