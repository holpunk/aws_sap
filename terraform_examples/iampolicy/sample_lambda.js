// index.js

exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hi'),
    };
    return response;
};
