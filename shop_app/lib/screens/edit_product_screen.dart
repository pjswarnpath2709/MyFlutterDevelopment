import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/effects/Effects.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const String routeName = '/edit_product_screen';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _discriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;
  var _editedProduct = Product(
    id: '',
    title: '',
    price: 0.0,
    discription: '',
    imageUrl: '',
  );
  var _initValues = <String, String>{
    'title': '',
    'discription': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;
      if (productId != '') {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'discription': _editedProduct.discription,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _validate() {
    if (_form.currentState!.validate()) {
      EffectsOnScreen.showToast("All feilds are valid", context);
    } else {
      EffectsOnScreen.showToast("Not Valid", context);
    }
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _discriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id.isEmpty) {
      try {
        await Provider.of<Products>(
          context,
          listen: false,
        ).addProducts(
          _editedProduct,
        );
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('An error Occured'),
              content: const Text('something went wrong'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
      // finally {
      //   print('then is executing');
      //   setState(
      //     () {
      //       _isLoading = false;
      //     },
      //   );

      //   Navigator.of(context).pop();
      // }
    } else {
      await Provider.of<Products>(
        context,
        listen: false,
      ).updateProduct(
        _editedProduct.id,
        _editedProduct,
      );
    }
    setState(
      () {
        _isLoading = false;
      },
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(
              Icons.save,
            ),
          ),
          IconButton(
            onPressed: _validate,
            icon: const Icon(Icons.verified_rounded),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      initialValue: _initValues['title'],
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          _priceFocusNode,
                        );
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: value.toString(),
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                          discription: _editedProduct.discription,
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Provide a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: '＄- Price',
                      ),
                      initialValue: _initValues['price'],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          _discriptionFocusNode,
                        );
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          price: double.parse(value as String),
                          imageUrl: _editedProduct.imageUrl,
                          discription: _editedProduct.discription,
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a Price';
                        } else if (double.tryParse(value) == null) {
                          return 'Please Enter a Valid number';
                        } else if (double.parse(value) <= 0) {
                          return "Please enter a number greater than zero";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Discription',
                      ),
                      initialValue: _initValues['discription'],
                      focusNode: _discriptionFocusNode,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                          discription: value.toString(),
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a discription';
                        } else if (value.length <= 10) {
                          return 'should be atleast 10 characters long...';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? const Text('Enter a URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'ImageUrl',
                            ),
                            controller: _imageUrlController,
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                title: _editedProduct.title,
                                price: _editedProduct.price,
                                imageUrl: value as String,
                                discription: _editedProduct.discription,
                                id: _editedProduct.id,
                                isFavorite: _editedProduct.isFavorite,
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter an image Url';
                              } else if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter  a valid imageUrl';
                              } else {
                                (_editedProduct);
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
