REPORT zhfdp_factory_pizzafm.

CLASS lcl_out DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      println
        IMPORTING
          i_message TYPE string.
ENDCLASS.

CLASS lcl_out IMPLEMENTATION.
  METHOD println.
    WRITE: / i_message.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_pizza DEFINITION
      ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      prepare,
      bake,
      cut,
      box,
      get_name
        RETURNING VALUE(r_name) TYPE string,
      to_string
        RETURNING VALUE(r_str) TYPE string.

  PROTECTED SECTION.
    DATA:
      name     TYPE string,
      dough    TYPE string,
      sauce    TYPE string,
      toppings TYPE STANDARD TABLE OF string.
ENDCLASS.

CLASS lcl_pizza IMPLEMENTATION.

  METHOD prepare.
    lcl_out=>println( `Prepare` && name ).
    lcl_out=>println( `Tossing dough...` ).
    lcl_out=>println( `Adding sauce...` ).
    lcl_out=>println( `Adding toppings: ` ).
    LOOP AT toppings ASSIGNING FIELD-SYMBOL(<topping>).
      lcl_out=>println( `   ` && <topping> ).
    ENDLOOP.
  ENDMETHOD.

  METHOD bake.
    lcl_out=>println(`Bake for 25 minutes at 350` ).
  ENDMETHOD.

  METHOD cut.
    lcl_out=>println(`Cut the pizza into diagonal slices` ).
  ENDMETHOD.

  METHOD box.
    lcl_out=>println(`Place pizza in official PizzaStore box` ).
  ENDMETHOD.

  METHOD get_name.
    r_name = name.
  ENDMETHOD.

  METHOD to_string.
    DATA:
      display TYPE STANDARD TABLE OF string.

    APPEND `---- ` && name && ` ----` TO display.
    APPEND dough TO display.
    APPEND sauce TO display.
    LOOP AT toppings ASSIGNING FIELD-SYMBOL(<topping>).
      APPEND <topping> TO display.
    ENDLOOP.

    LOOP AT display ASSIGNING FIELD-SYMBOL(<line>).
      lcl_out=>println( <line> ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_ny_style_cheese_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_ny_style_cheese_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `NY Style Sauce and Cheese Pizza`.
    dough = `Thin Crust Dough`.
    sauce = `Marinara Sauce`.

    APPEND `Grated Reggiano Cheese` TO toppings.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_ny_style_clam_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_ny_style_clam_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `NY Style Clam Pizza`.
    dough = `Thin Crust Dough`.
    sauce = `Marinara Sauce`.

    APPEND `Grated Reggiano Cheese` TO toppings.
    APPEND `Fresh Clams from Long Island Sound` TO toppings.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_ny_style_pepperoni_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_ny_style_pepperoni_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `NY Style Pepperoni Pizza`.
    dough = `Thin Crust Dough`.
    sauce = `Marinara Sauce`.

    APPEND `Grated Reggiano Cheese` TO toppings.
    APPEND `Sliced Pepperoni` TO toppings.
    APPEND `Garlic` TO toppings.
    APPEND `Onion` TO toppings.
    APPEND `Mushrooms` TO toppings.
    APPEND `Red Pepper` TO toppings.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_ny_style_veggie_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor.
ENDCLASS.

CLASS lcl_ny_style_veggie_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `NY Style Veggie Pizza`.
    dough = `Thin Crust Dough`.
    sauce = `Marinara Sauce`.

    APPEND `Grated Reggiano Cheese` TO toppings.
    APPEND `Garlic` TO toppings.
    APPEND `Onion` TO toppings.
    APPEND `Mushrooms` TO toppings.
    APPEND `Red Pepper` TO toppings.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_chi_style_cheese_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor,
      cut REDEFINITION.
ENDCLASS.

CLASS lcl_chi_style_cheese_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `Chicago Style Deep Dish Cheese Pizza`.
    dough = `Extra Thick Crust Dough`.
    sauce = `Plum Tomato Sauce`.

    APPEND `Shredded Mozzarella Cheese` TO toppings.
  ENDMETHOD.

  METHOD cut.
    lcl_out=>println( `Cutting the pizza into square slices` ).
  ENDMETHOD.
ENDCLASS.

"There is restriction on id length in ABAP. The word Chicago is reduced to Chi.
CLASS lcl_chi_style_clam_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor,
      cut REDEFINITION.
ENDCLASS.

CLASS lcl_chi_style_clam_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `Chicago Style Clam Pizza`.
    dough = `Extra Thick Crust Dough`.
    sauce = `Plum Tomato Sauce`.

    APPEND `Shredded Mozzarella Cheese` TO toppings.
    APPEND `Frozen Clams from Chesapeake Bay` TO toppings.
  ENDMETHOD.

  METHOD cut.
    lcl_out=>println( `Cutting the pizza into square slices` ).
  ENDMETHOD.
ENDCLASS.

CLASS lcl_chi_style_pepperoni_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor,
      cut REDEFINITION.
ENDCLASS.

CLASS lcl_chi_style_pepperoni_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `Chicago Style Pepperoni Pizza`.
    dough = `Extra Thick Crust Dough`.
    sauce = `Plum Tomato Sauce`.

    APPEND `Shredded Mozzarella Cheese` TO toppings.
    APPEND `Black Olives` TO toppings.
    APPEND `Spinach` TO toppings.
    APPEND `Eggplant` TO toppings.
    APPEND `Sliced Pepperoni` TO toppings.
  ENDMETHOD.

  METHOD cut.
    lcl_out=>println( `Cutting the pizza into square slices` ).
  ENDMETHOD.
ENDCLASS.

CLASS lcl_chi_style_veggie_pizza DEFINITION
      INHERITING FROM lcl_pizza.
  PUBLIC SECTION.
    METHODS:
      constructor,
      cut REDEFINITION.
ENDCLASS.

CLASS lcl_chi_style_veggie_pizza IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    name = `Chicago Style Pepperoni Pizza`.
    dough = `Extra Thick Crust Dough`.
    sauce = `Plum Tomato Sauce`.

    APPEND `Shredded Mozzarella Cheese` TO toppings.
    APPEND `Black Olives` TO toppings.
    APPEND `Spinach` TO toppings.
    APPEND `Eggplant` TO toppings.
  ENDMETHOD.

  METHOD cut.
    lcl_out=>println( `Cutting the pizza into square slices` ).
  ENDMETHOD.
ENDCLASS.

CLASS lcl_pizza_store DEFINITION
      ABSTRACT.
  PUBLIC SECTION.
    METHODS:
      order_pizza
        IMPORTING
                  i_type         TYPE string
        RETURNING VALUE(r_pizza) TYPE REF TO lcl_pizza.

  PROTECTED SECTION.
    METHODS:
      create_pizza ABSTRACT
        IMPORTING
                  i_item         TYPE string
        RETURNING VALUE(r_pizza) TYPE REF TO lcl_pizza.
ENDCLASS.

CLASS lcl_pizza_store IMPLEMENTATION.
  METHOD order_pizza.
    DATA:
      pizza TYPE REF TO lcl_pizza.

    pizza = create_pizza( i_type ).
    lcl_out=>println( `--- Making a ` && pizza->get_name( ) && ` ---` ).
    pizza->prepare( ).
    pizza->bake( ).
    pizza->cut( ).
    pizza->box( ).

    r_pizza = pizza.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_ny_pizza_store DEFINITION
      INHERITING FROM lcl_pizza_store.
  PROTECTED SECTION.
    METHODS:
      create_pizza REDEFINITION.
ENDCLASS.

CLASS lcl_ny_pizza_store IMPLEMENTATION.
  METHOD create_pizza.
    IF ( i_item = `cheese` ).
      r_pizza = NEW lcl_ny_style_cheese_pizza( ).
    ELSEIF ( i_item = `veggie` ).
      r_pizza = NEW lcl_ny_style_veggie_pizza( ).
    ELSEIF ( i_item = `clam` ).
      r_pizza = NEW lcl_ny_style_clam_pizza( ).
    ELSEIF ( i_item = `pepperoni` ).
      r_pizza = NEW lcl_ny_style_pepperoni_pizza( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_chi_pizza_store DEFINITION
      INHERITING FROM lcl_pizza_store.
  PROTECTED SECTION.
    METHODS:
      create_pizza REDEFINITION.
ENDCLASS.

CLASS lcl_chi_pizza_store IMPLEMENTATION.
  METHOD create_pizza.
    IF ( i_item = `cheese` ).
      r_pizza = NEW lcl_chi_style_cheese_pizza( ).
    ELSEIF ( i_item = `veggie` ).
      r_pizza = NEW lcl_chi_style_veggie_pizza( ).
    ELSEIF ( i_item = `clam` ).
      r_pizza = NEW lcl_chi_style_clam_pizza( ).
    ELSEIF ( i_item = `pepperoni` ).
      r_pizza = NEW lcl_chi_style_pepperoni_pizza( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_pizza_test_drive DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      main.
ENDCLASS.

CLASS lcl_pizza_test_drive IMPLEMENTATION.
  METHOD main.
    DATA:
      ny_store      TYPE REF TO lcl_pizza_store,
      chicago_store TYPE REF TO lcl_pizza_store.

    ny_store = NEW lcl_ny_pizza_store( ).
    chicago_store = NEW lcl_chi_pizza_store( ).

    DATA(pizza) = ny_store->order_pizza( `cheese` ).
    lcl_out=>println( `Ethan ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `cheese` ).
    lcl_out=>println( `Joel ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `clam` ).
    lcl_out=>println( `Ethan ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `clam` ).
    lcl_out=>println( `Joel ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `pepperoni` ).
    lcl_out=>println( `Ethan ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `pepperoni` ).
    lcl_out=>println( `Joel ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `veggie` ).
    lcl_out=>println( `Ethan ordered a ` && pizza->get_name( ) ).

    pizza = chicago_store->order_pizza( `veggie` ).
    lcl_out=>println( `Joel ordered a ` && pizza->get_name( ) ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl_pizza_test_drive=>main( ).
