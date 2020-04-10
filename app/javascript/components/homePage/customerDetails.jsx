import React, { Component } from 'react';
import { Form, Col, Row} from 'react-bootstrap';
import Select from 'react-select';

class CustomerDetails extends Component {
    constructor(props) {
        super(props);
        this.state = { 
            phone_number: '',
            size: { label: 'Select Car Size', value: 'Select' },
            size_options: [],
            service: { label: 'Select Serivce Type', value: 'Select' },
            service_options: [],
            isSize: false,
            isService: false,
            price: 0
         }
    }
    
    componentDidMount = () => {
        this.getOptions('service_type', 'service_options');
        this.getOptions('car_size', 'size_options');
    }

    getOptions = (url, option_type) => {
        
        fetch("/api/v1/frontend/:id/" + url)
            .then(res => res.json())
                .then( (result) => {
                    let options = result.map(option => {
                        return { label: option, value: option}
                    });
                    this.setState({
                        [option_type]: options
                    });
                },
                (error) => {
                    this.setState({
                        error
                    });
                })
    }

    getPrice = () => {
        if ( this.state.isSize && this.state.isService ) {
        fetch("/api/v1/frontend/:id/price", {
            method: "POST",
            body: JSON.stringify({
                "service_name": this.state.service.value,
	            "car_size": this.state.size.value
            }),
            headers: {
                "Content-type": "application/json"
            }
        }).then(res => res.json())
            .then( (result) => {
                console.log(result.price);
                this.setState({
                    price: result.price
                });
            })  
    }
    }

    handleSelectChange = (value, event) => {
        console.log(value, event);
        if (event.name === 'size') {
            console.log('hh');

            this.setState({
                isSize: true
            }, () => this.getPrice());
        }
        else {
            this.setState({
                isService: true
            }, () => this.getPrice());
        }
        this.setState({[event.name]: value});
        console.log(this.state.isService, this.state.isSize);
    }

    render() { 
        return ( 
            <Form>
                <Form.Group>
                    <Form.Label>Phone-Number:</Form.Label>
                    <Form.Control type="text" placeholder="Enter 10 digit phone number" pattern="^[0-9]{10}$" required />
                </Form.Group>
                <Row>
                    <Form.Group as={Col} controlId="formGridName">
                      <Form.Label>Name</Form.Label>
                      <Form.Control type="text" placeholder="Enter Customer Name" required/>
                    </Form.Group>

                    <Form.Group as={Col} controlId="formGridRegnumber">
                      <Form.Label>Registration Number</Form.Label>
                      <Form.Control type="text" placeholder="Enter Reg Number" required/>
                    </Form.Group>
                </Row>
                <Row>
                    <Form.Group as={Col} controlId="formGridCarname">
                      <Form.Label>Car Name</Form.Label>
                      <Form.Control type="text" placeholder="Enter Car Name" required/>
                    </Form.Group>
                    <Form.Group as={Col} controlId="formGridSize">
                        <Form.Label>Car Size</Form.Label>
                        <Select name="size"
                            options={this.state.size_options}
                            value={this.state.size}
                            onChange={(value, event) => this.handleSelectChange(value, event)}
                        />
                    </Form.Group>
                </Row>
                <Row>
                    <Form.Group as={Col} controlId="formGridService">
                        <Form.Label>Service</Form.Label>
                        <Select name="service"
                            options={this.state.service_options}
                            value={this.state.service}
                            onChange={(value, event) => this.handleSelectChange(value, event)}
                        />
                    </Form.Group>
                    <Form.Group as={Col} controlId="formGridPrice">
                        <Form.Label>Price</Form.Label>
                        <Form.Control type="text" placeholder="Cost" value={this.state.price} disabled required/>
                    </Form.Group>
                </Row>
                
            </Form>
         );
    }
}
 
export default CustomerDetails;
