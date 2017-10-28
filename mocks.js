routes = [
		{ // test route
				route: "/test",
				handle: function (req, res, next) {
						res.setHeader('Content-Type', 'application/json');
						res.end(JSON.stringify({
								"data": {
									"greeting": "Hello"
								},
								"status": "success",
								"count": 1
						}));
				}
		}
];

module.exports = routes;
