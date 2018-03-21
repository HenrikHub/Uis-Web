"""
Assignment 8: Booking site
"""

from flask import Flask, request, render_template

app = Flask(__name__)
app.debug = True


@app.route("/")
def index():
    """Index page that shows a list of properties"""
    # TODO: fetch all properties from database
    return render_template("index.html")


def get_property(property_id):
    """Loads a property from the database."""
    # TODO: look up property from database
    property_data = {
        "property_id": property_id
    }
    return property_data


@app.route("/property/<int:property_id>")
def property(property_id):
    """Product page"""
    return render_template("property.html", property=get_property(property_id))


@app.route("/book", methods=["POST"])
def book():
    """Booking process"""
    action = request.form.get("action")
    if action == "do_1":
        # TODO: check booking details, if all correct show confirmation form,
        # otherwise show order form again (with filled-in values remembered)
        return render_template("booking_2.html")
    elif action == "do_2":
        if request.form.get("confirm") == "1":  # check if booking is confirmed
            # TODO: save booking in database and return confirmation number
            return render_template("booking_3.html", booking_id="123")
        else:
            return render_template("booking_2.html", err="You need to confirm the booking.")
    else:
        # TODO: display form asking for details
        return render_template("booking_1.html")


if __name__ == "__main__":
    app.run()
