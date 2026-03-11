
import 'package:accounts/tickets/controllers/ticket_sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketSalesPage extends StatelessWidget {
  TicketSalesPage({Key? key}) : super(key: key);

  final TicketSalesController controller = Get.put(TicketSalesController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            // Table Section
            Expanded(
              child: Obx(() => _buildDataTable()),
            ),

            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Ticket Sales',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A5F),
            ),
          ),
          Row(
            children: [
              Container(
                width: 280,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: controller.searchController,
                  onChanged: controller.onSearch,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                    suffixIcon: Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              ElevatedButton.icon(
                onPressed: controller.onExport,
                icon: const Icon(Icons.file_download_outlined, size: 18),
                label: const Text('Export'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8B3D),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),

              const SizedBox(width: 8),

              ElevatedButton.icon(
                onPressed: controller.onNewTicketSales,
                icon: const Icon(Icons.add, size: 18),
                label: const Text('New Ticket Sales'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A5F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return Column(
      children: [
        // Fixed Header
        Container(
          color: const Color(0xFF1E3A5F),
          child: Row(
            children: [
              _buildHeaderCell('SN', width: 50),
              _buildHeaderSeparator(),
              _buildHeaderCell('TRANSACTION_DATE', width: 150),
              _buildHeaderSeparator(),
              _buildHeaderCell('GENDER', width: 100),
              _buildHeaderSeparator(),
              _buildHeaderCell('PNR', width: 120),
              _buildHeaderSeparator(),
              _buildHeaderCell('NET_FARES', width: 120),
              _buildHeaderSeparator(),
              _buildHeaderCell('SALES_FARE', width: 120),
              _buildHeaderSeparator(),
              _buildHeaderCell('TICKET_NUMBER', width: 140),
              _buildHeaderSeparator(),
              _buildHeaderCell('TICKET_STATUS', width: 140),
              _buildHeaderSeparator(),
              _buildHeaderCell('DISCOUNT', width: 100),
              _buildHeaderSeparator(),
              _buildHeaderCell('PAYMENT_STATUS', width: 150),
              _buildHeaderSeparator(),
              _buildHeaderCell('INV_STATUS', width: 110),
              _buildHeaderSeparator(),
              _buildHeaderCell('REMARKS', width: 100),
            ],
          ),
        ),

        // Scrollable Rows
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: controller.tickets.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> ticket = entry.value;
                bool isEven = index % 2 == 0;

                return Container(
                  color: isEven ? Colors.white : const Color(0xFFF4F9FF),
                  child: Row(
                    children: [
                      _buildDataCell(ticket['sn'], width: 50),
                      _buildDataCell(ticket['date'], width: 150),
                      _buildDataCell(ticket['gender'], width: 100),
                      _buildDataCell(ticket['pnr'], width: 120),
                      _buildDataCell(ticket['netFares'], width: 120),
                      _buildDataCell(ticket['salesFare'], width: 120),
                      _buildDataCell(ticket['ticketNumber'], width: 140),
                      _buildStatusCell(
                        ticket['ticketStatus'],
                        _getTicketStatusColor(ticket['ticketStatus']),
                        width: 140,
                      ),
                      _buildDataCell(ticket['discount'], width: 100),
                      _buildStatusCell(
                        ticket['paymentStatus'],
                        _getPaymentStatusColor(ticket['paymentStatus']),
                        width: 150,
                      ),
                      _buildDataCell(ticket['invStatus'], width: 110),
                      _buildDataCell(ticket['remarks'], width: 100),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Showing 1 to 8 of 14 entries',
                style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: controller.previousPage,
                    icon: const Icon(Icons.chevron_left),
                  ),

                  ...List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => controller.changePage(index + 1),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index + 1
                              ? const Color(0xFF1E3A5F)
                              : Colors.white,
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: controller.currentPage.value == index + 1
                                  ? Colors.white
                                  : const Color(0xFF374151),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),

                  IconButton(
                    onPressed: controller.nextPage,
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget _buildHeaderCell(String text, {required double width}) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 11,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSeparator() {
    return Container(
      width: 1,
      height: 48,
      color: Colors.white30,
    );
  }

  Widget _buildDataCell(String text, {required double width}) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF374151),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCell(String text, Color color, {required double width}) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTicketStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'issued':
        return const Color(0xFF10B981);
      case 'cancelled':
        return const Color(0xFFEF4444);
      case 'exchange':
        return const Color(0xFF3B82F6);
      case 'refund':
        return const Color(0xFFA855F7);
      case 'void':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF6B7280);
    }
  }

  Color _getPaymentStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'settled':
        return const Color(0xFF10B981);
      case 'due':
        return const Color(0xFFEF4444);
      case 'pending':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF6B7280);
    }
  }
}