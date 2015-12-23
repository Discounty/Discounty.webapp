import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Card from '../components/card/Card';
import Layout from './Layout';

@pureRender
export default class Dashboard extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        sidebarNavItems: PropTypes.arrayOf(PropTypes.shape({
            itemString: PropTypes.string.isRequired,
            itemUrl: PropTypes.string,
            counter: PropTypes.integer,
        })).isRequired,

        sidebarLabelString: PropTypes.string,
        headerLogo: PropTypes.shape({
            hrefUrl: PropTypes.string,
            imgUrl: PropTypes.string.isRequired,
        }),

        menuString: PropTypes.string,
        searchPlaceholder: PropTypes.string.isRequired,
        searchAction: PropTypes.func,

        topNavigationLinks: PropTypes.arrayOf(PropTypes.shape({
            linkUrl: PropTypes.string,
            linkName: PropTypes.string.isRequired,
        })).isRequired,

        topNavigationDropdownLinks: PropTypes.arrayOf(PropTypes.shape({
            linkUrl: PropTypes.string,
            linkName: PropTypes.string.isRequired,
        })).isRequired,

        topNavigationAvatarLink: PropTypes.string.isRequired,

        topNavigationAccount: PropTypes.shape({
            string: PropTypes.string.isRequired,
            url: PropTypes.string.isRequired,
        }).isRequired,

        customerCards: PropTypes.arrayOf(PropTypes.shape({
            cardName: PropTypes.string.isRequired,
            cardDescription: PropTypes.string,
            cardLinkString: PropTypes.string.isRequired,
            cardLinkUrl: PropTypes.string.isRequired,
            cardType: PropTypes.string.isRequired, // coupon or discount
        })),
    }

    render() {
        const cards = this.props.customerCards.map((card, index) => {
            return (
                <div key={index} className="card-block">
                    <Card {...card} />
                </div>
            );
        });

        return (
            <Layout {...this.props} >

                {cards}

            </Layout>
        );
    }
}
