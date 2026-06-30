# KARM-metadata-etd2marc
Copy of the XSLT script and colab python notebook used to transform ETD metadata from WVU's research repository into MARC/XML uploaded to OCLC

The script is set up to access WVU's repository via OAI and retrieve Bepress document-export metadata. The XSLT script maps this metadata from document-export into MARC/XML. The jupyter notebook combines these processes into one script that also validates and uploads the MARC/XML to WorldCat.

1. [Building your own ETD2MARC process](https://github.com/wvulibraries/KARM-metadata-etd2marc/wiki/Building-your-own-ETD2MARC-Process)
   1. Getting started
   1. Editing the XSLT
   1. Editing the Python notebook
1. [Running the script](https://github.com/wvulibraries/KARM-metadata-etd2marc/wiki/Running-the-script)
   1. Dependencies
   1. Suggested workflow
