import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';

// ignore: use_key_in_widget_constructors
class EditProductScreen extends StatefulWidget {
  static const String routeName = "/edit-product-screen";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
//////+++++++++++++++++++++++++++++++++++++++++//////

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '',
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

//////+++++++++++++++++++++++++++++++++++++++++//////

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('https') &&
              !_imageUrlController.text.startsWith('http')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg') &&
              !_imageUrlController.text.endsWith('.gif'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (isValid == false) {
      return;
    }
    _form.currentState!.save();
    final productsData = Provider.of<Products>(context, listen: false);
    productsData.addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit-Products'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              //////+++++++++++++++++++++++++++++++++++++++++//////

              // Title Input Field
              TextFormField(
                //--------------------------//
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                //--------------------------//
                textInputAction: TextInputAction.next,
                //--------------------------//
                keyboardType: TextInputType.text,
                //--------------------------//
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide Non-Empty Title';
                  }
                  return null;
                },
                //--------------------------//
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                //--------------------------//
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: value.toString(),
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                //--------------------------//
              ),

              //////+++++++++++++++++++++++++++++++++++++++++//////

              //  Price Input Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                //--------------------------//
                keyboardType: TextInputType.number,
                //--------------------------//
                textInputAction: TextInputAction.next,
                //--------------------------//

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Price';
                  } else if (double.tryParse(value) == null) {
                    return 'Please enter a Valid Number';
                  } else if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than 0';
                  } else {
                    return null;
                  }
                },

                //--------------------------//
                focusNode: _priceFocusNode,
                //--------------------------//

                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },

                //--------------------------//
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(
                      value.toString(),
                    ),
                    imageUrl: _editedProduct.imageUrl,
                  );
                  //--------------------------//
                },
              ),

              //////+++++++++++++++++++++++++++++++++++++++++//////

              // Description Input Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),

                //--------------------------//
                maxLines: 3,
                //--------------------------//
                keyboardType: TextInputType.multiline,
                //--------------------------//
                textInputAction: TextInputAction.next,
                //--------------------------//
                focusNode: _descriptionFocusNode,
                //--------------------------//

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter description';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 character long';
                  }
                  return null;
                },

                //--------------------------//

                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: value.toString(),
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
                //--------------------------//
              ),

              //////+++++++++++++++++++++++++++++++++++++++++//////

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
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

                  //--------------------------//

                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'ImageUrl',
                      ),
                      //--------------------------//
                      keyboardType: TextInputType.url,
                      //--------------------------//
                      textInputAction: TextInputAction.done,
                      //--------------------------//
                      controller: _imageUrlController,
                      //--------------------------//
                      focusNode: _imageUrlFocusNode,
                      //--------------------------//
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      //--------------------------//
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter a Image URL.';
                        }
                        if (!value.startsWith('https') &&
                            !value.startsWith('http')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpeg') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.gif')) {
                          return 'Please enter a valid Image URL.';
                        }
                        return null;
                      },
                      //--------------------------//
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value.toString(),
                        );
                      },
                      //--------------------------//
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
