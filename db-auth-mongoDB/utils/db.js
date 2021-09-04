const mongoose = require("mongoose");
mongoose.connect(
  "mongodb+srv://Dafin:fajri2015@cluster0.7e5dt.mongodb.net/test?retryWrites=true&w=majority",
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);
