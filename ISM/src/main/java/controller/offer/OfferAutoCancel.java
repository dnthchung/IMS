package controller.offer;

import dao.OfferDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import model.Candidate;

/**
 *
 * @author tranh
 */
public class OfferAutoCancel implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        timer = new Timer(true);

        // Lấy thời điểm hiện tại
        Calendar currentTime = Calendar.getInstance();

        // Tính thời gian cần đợi cho đến 0 giờ sáng hôm sau
        Calendar scheduledTime = Calendar.getInstance();
        scheduledTime.set(Calendar.HOUR_OF_DAY, 0);
        scheduledTime.set(Calendar.MINUTE, 0);
        scheduledTime.set(Calendar.SECOND, 0);
        scheduledTime.set(Calendar.MILLISECOND, 0);
        if (scheduledTime.before(currentTime) || scheduledTime.equals(currentTime)) {
            scheduledTime.add(Calendar.DAY_OF_MONTH, 1);
        }
        long delay = scheduledTime.getTimeInMillis() - currentTime.getTimeInMillis();

        // Lên lịch công việc để chạy vào 0 giờ sáng hàng ngày
        timer.scheduleAtFixedRate(new SendReminderTask(), delay, 24 * 60 * 60 * 1000);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        timer.cancel();
    }

    private class SendReminderTask extends TimerTask {

        @Override
        public void run() {
            OfferDAO offerDAO = new OfferDAO();
            List<Long> offers = offerDAO.getOffersOverDueDateToday();
            if (offers.isEmpty()) {
                System.out.println("No overdue offer today!");
            } else {
                for (Long offer : offers) {
                    offerDAO.updateNewOfferStatus(offer.toString(), 7, 37L);
                    Candidate candidate = offerDAO.getCandidateByOfferId(offer);
                    offerDAO.updateCandidateStatus(candidate.getCandidateId(), 8);
                    System.out.println("Canceled offer with id = " + offer + " successfully!");
                }
            }
        }
    }
}
