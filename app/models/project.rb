class Project < ApplicationRecord
  belongs_to :client
  has_many :jobs

  def self.search(search)
    where("address ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

  def download
    html = render_to_string(:action => :show, :layout => "pdf_layout.html")
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data(pdf,
      :filename => "my_pdf_name.pdf",
      :disposition => 'attachment')
  end

  def total
    total_cost = 0
    if self.jobs.any?
      self.jobs.each do |job|
        total_cost += job.rate * job.hours
      end
    end
    total_cost
  end
end
