class JsonParserController < ApplicationController
  include JsonParserHelper
  def parse
    if @json_parser_last_choose.nil?
      @json_parser_last_choose = "url"
    end
    @json_parser_expression = params[:expression].nil? ? "" : params[:expression]
    @json_parser_url = params[:url].nil? ? "" : params[:url]
    @json_parser_json_text = params[:json_text].nil? ? "" : params[:json_text]

    keys = @json_parser_expression.split(".")

    parse_source = params[:parse_source]

    if parse_source == "url"
      @json_parser_last_choose = "url"
      content = open(@json_parser_url)
    elsif parse_source == "json_text_encoded"
      @json_parser_last_choose = "json_text_encoded"
      content = @json_parser_json_text
    elsif parse_source == "json_text"
      @json_parser_last_choose = "json_text"
      content = @json_parser_json_text
    elsif parse_source == "text_to_json"
      @json_parser_last_choose = "text_to_json"
      content = @json_parser_json_text
    end

    if (content)
      decoded = decode(content)
      result = decoded

      keys.each do |key|
        if result
          result = result[key]
        end
      end

      if @json_parser_last_choose == "json_text_encoded"
        @json_parser_result = result
      elsif @json_parser_last_choose == "text_to_json"
        @json_parser_result = content.to_json
      else
        begin
          result = JSON.parse(result.to_json)
          @json_parser_result = JSON.pretty_generate(result)
        rescue JSON::ParserError
          @json_parser_result = result
        end
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
