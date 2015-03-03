// Overload this file in your own device-specific config if you need
// non-standard property_perms and/or control_perms structs
//
// To avoid conflicts...
// if you redefine property_perms, #define PROPERTY_PERMS there
// if you redefine control_perms, #define CONTROL_PARMS there
//
// A typical file will look like:
//

// Alternatively you can append to the existing property_perms and/or
// control_perms structs with the following:
#define PROPERTY_PERMS_APPEND \
    { "persist.ril.stat.reboot",       AID_RADIO,    0 }, \
    { "persist.ril.stat.usb.reset",    AID_RADIO,    0 }, \
    { "persist.ril.",                  AID_RADIO,    0 },
