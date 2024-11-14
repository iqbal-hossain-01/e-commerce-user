/*
CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  animateToClosest: true,
                  enableInfiniteScroll: true,
                  reverse: true,
                ),
                items: products.map((product){
                  return Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            ProductDetailScreen.routeName,
                            pathParameters: {'id': product.id.toString()},
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(product.imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              color: Colors.deepPurpleAccent.withOpacity(0.35),
                              child: Text(
                                product.productName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,

                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
 */