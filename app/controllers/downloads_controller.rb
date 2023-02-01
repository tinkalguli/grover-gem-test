class DownloadsController < ActionController::Base
    def index
        html = render_to_string({ template: "shared/roost" })
        header = render_to_string({ template: "shared/_header", layout: false })
        footer = render_to_string({ template: "shared/_footer", layout: false })

        grover = Grover.new(
        html,
        header_template: header,
        footer_template: footer,
        display_header_footer: true,
        margin: {
            top: "110px",
            bottom: "110px"
        },
        )
        pdf = grover.to_pdf

        send_data(pdf, filename: "grover_test.pdf")
    end
end
