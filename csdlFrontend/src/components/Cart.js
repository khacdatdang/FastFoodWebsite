import React, { Component } from 'react';
import '../Css/cart.css';
import axios from '../axios';
import NavBar from './NavBar';

class Cart extends Component {
    state = {
        // products: [],
        userInfo: [],
        cartInfo: [],
        total: 0
    }

    async UNSAFE_componentWillMount() {
        const username = localStorage.getItem('username');
        try {
            const userData = await fetch(`http://localhost:5000/customer/info/${username}`,
                {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    credentials: 'include'
                }
            ).then((res) => { return res.json(); });
            console.log(userData.data);
            const cartData = await fetch(`http://localhost:5000/cart/${username}`,
                {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    credentials: 'include'
                }
            ).then((res) => { return res.json(); });
            console.log(cartData.data);
            let total = 0;
            for (const item of cartData.data) {
                total += item.Price * item.Quantity
            }
            this.setState({
                userInfo: userData.data,
                cartInfo: cartData.data,
                total: total
            });

        } catch (err) {
            console.log(err.message);
        }
    }

    handlePurchase = async (event) => {
        event.preventDefault();
        let orderList = [];
        for (const item of this.state.cartInfo) {
            const newItem = {
                productID: item.ProductID,
                quantity: item.Quantity
            };
            orderList.push(newItem);
        }
        console.log(orderList);
        try {
            const data = await fetch("http://localhost:5000/order/new-order/", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                credentials: "include",
                body: JSON.stringify({
                    username: localStorage.getItem('username'),
                    orderList: orderList,
                    total: this.state.total * 1.05,
                    status: "?????t h??ng th??nh c??ng"
                })
            }).then((res) => { return res.json(); });
            console.log(data)
            if (!data.success) {
                window.alert(data.message);
            } else {
                window.alert("?????t h??ng th??nh c??ng!");
                window.location.href = '/order-list';
            }
        } catch (err) {
            this.setState({
                errMessage: err.message
            });
        }
    }


    _Delete = (item, event) => {
        event.preventDefault();
        console.log("xoa no:", item);
        axios.delete('/cart/delete', {
            data: {
                username: localStorage.getItem('username'),
                productID: item.ProductID
            }
        })
            .then(response => {
                console.log(response.data.success);
                // const i = this.state.cartInfo.indexOf(item);
                // if (i != -1) {
                //     this.setState({
                //         cartInfo: this.state.cartInfo.splice(i, 1)
                //     });
                // }
                // console.log(this.state.cartInfo);
                window.location.href='/cart';
            })
            .catch(err => console.log(err))
    }

    // Decrease = (item,event) => {
    //     event.preventDefault();
    //     if(item.Quantity>1){
    //         item.Quantity--;
    //         this.setState({Total:0});
    //         this.props.state.Total-=item.Price;
    //     }
    //     axios.post('/cart/update',{
    //         quantity:item.Quantity-1,
    //         username:localStorage.getItem('username'),
    //         productID:item.productID
    //     })
    //     .then(response => {
    //         console.log(response.data.success)
    //       })
    //     .catch(err => console.log(err));
    // }

    // Increment = (item,event) => {
    //     event.preventDefault(); 
    //     item.Quantity++;
    //     this.setState({Total:1})
    //     this.props.state.Total+=item.Price;
    // }

    render() {
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        const cartItems = this.state.cartInfo.map(item => (
            <div key={item.ProductID} className="cart-item">
                {/* <div className="cart-checkbox">
                    <input type="checkbox" />
                </div> */}
                <div className="cart-img">
                    <img src={`http://localhost:5000/image/products/${item.Image}.png`} alt={item.ProductID} />
                </div>
                <div className="cart-description">
                    <span>{item.Name}</span>
                </div>
                <div className="cart-price">
                    <span>{numberWithCommas(item.Price)}</span>
                </div>
                <div className="cart-quantity">
                    <div className='quantity-sub'>
                        <button type="button" onClick={(event) => this.props.Decrease(item, event)} className="btn btn-dark" ><i className="fas fa-minus" href="/home"></i></button>
                        <input type="number" name="quantity" min="1" placeholder={item.Quantity} />
                        <button type="button" onClick={(event) => this.props.Increase(item, event)} className="btn btn-light"><i className="fas fa-plus"></i></button>
                    </div>
                </div>
                <div className="cart-remove">
                    <div className="list-delete">
                        {/* <i className="fas fa-trash" onClick={(event) => { this._Delete(item, event) }}></i> */}
                        <button className="btn btn-danger" onClick={(event) => { this._Delete(item, event) }}>X??a</button>
                    </div>
                </div>
            </div>
        ));
        return (
            <div>
                <NavBar products={this.props.state.products} handleSearch={this.props.handleSearch} Total={this.props.state.Total} count={this.props.state.count} />
                <div className="cartcontent">
                <div className="cart-top">
                   <a href="/">Trang ch???</a>
                   <i className="fas fa-chevron-right"></i>
                   <a href="/">Gi??? h??ng</a>
               </div>
                    <div className="cart-bottom">
                        <div className="cart-bottom-left">
                        <div className="cart-header">
                               T???t c??? s???n ph???m ({this.props.state.count})
                        </div>
                            <div className="cart-bottom-left-top">
                                <div className="list-header">
                                    <div className='header-product'>
                                        S???n ph???m
                                    </div>
                                    <div className='header-price'>
                                        Gi?? th??nh
                                    </div>
                                    <div className='header-quantity'>
                                        S??? l?????ng
                                    </div>
                                    <div className='header-delete'></div>
                                </div>
                            </div>
                            <div className="cart-bottom-left-bottom">
                                {cartItems}
                            </div>
                        </div>
                        <div className="cart-bottom-right">
                            <div className="product-location">
                                <div className="location-header">?????a ch??? giao h??ng</div>
                                <div className="location-info-2">
                                    <div><i className="fas fa-user-check"></i>  Kh??ch h??ng: {this.state.userInfo.Name}</div>
                                    <div><i className="fas fa-map-marker"></i>  ?????a ch???: {this.state.userInfo.Address}</div>
                                    <div><i className="fas fa-mobile"></i>  S??? ??i???n tho???i: {this.state.userInfo.Phone}</div>
                                </div>

                            </div>
                            <div className="cart-summary">
                                <div className="summary-header">
                                    Th??ng tin gi??? h??ng
                                </div>
                                <div className="summary-content">
                                    <div className="sub-total">
                                        <div className="sub-total-left">
                                            T???m t??nh:
                                        </div>
                                        <div className="sub-total-right">
                                            {numberWithCommas(this.props.state.Total)}??
                                        </div>
                                    </div>
                                    <div className="ship-fee">
                                        <div className="ship-fee-left">Ph?? v???n chuy???n:</div>
                                        <div className="ship-fee-right">{numberWithCommas(this.props.state.Total / 20)}??</div>
                                    </div>
                                </div>
                                {/* <div className="summary-voucher">
                                    <input type="text" className="voucher-use" placeholder="voucher" />
                                    <button className="voucher-apply btn btn-primary">Apply</button>
                                </div> */}
                                <div className="summary-total">
                                    <div className="summary-total-left">T???ng:</div>
                                    <div className="summary-total-right">
                                        <div>{numberWithCommas(this.props.state.Total * 1.05)}??</div>
                                        <div>(???? bao g???m VAT)</div>
                                    </div>
                                </div>
                                <div className="summary-confirm">
                                    <button className="btn btn-danger btn-block" onClick={(event) => { this.handlePurchase(event); }}>
                                        Thanh to??n
                                        </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Cart;