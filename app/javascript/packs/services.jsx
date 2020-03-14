import React from 'react'
import ReactDOM from 'react-dom'
import Services from '../components/servicePage/services'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render( <Services />, document.body.appendChild(document.createElement('div')))
});
