module Utils
  CR = "\r"
  LF = "\n"
  SP = "\x20"
  HT = "\x9"
  CTL = 127.chr
  CRLF = CR + LF
  LWS = CRLF + SP

  STATUS_CODES = {
    :Continue => 100,
    :OK => 200,
    :Bad_Request => 400
  }

  STATUS_CODE_JUNC = {
    "100" => :Continue,
    "200" => :OK,
    "400" => :Bad_Request
  }

end
