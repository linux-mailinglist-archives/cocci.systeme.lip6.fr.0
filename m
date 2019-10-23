Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E0CE16E8
	for <lists+cocci@lfdr.de>; Wed, 23 Oct 2019 11:57:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9N9vVxQ011318;
	Wed, 23 Oct 2019 11:57:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 34DE677D0;
	Wed, 23 Oct 2019 11:57:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 71BAA77B4
 for <cocci@systeme.lip6.fr>; Wed, 23 Oct 2019 10:31:51 +0200 (CEST)
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9N8VlI3009615
 for <cocci@systeme.lip6.fr>; Wed, 23 Oct 2019 10:31:49 +0200 (CEST)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 447B0E2D470FAD69E41C;
 Wed, 23 Oct 2019 16:31:46 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x9N8UNET081660;
 Wed, 23 Oct 2019 16:30:23 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102316304296-91731 ;
 Wed, 23 Oct 2019 16:30:42 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: Julia.Lawall@lip6.fr
Date: Wed, 23 Oct 2019 16:32:43 +0800
Message-Id: <1571819563-18118-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-23 16:30:43,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-23 16:30:26, Serialize complete at 2019-10-23 16:30:26
X-MAIL: mse-fl1.zte.com.cn x9N8UNET081660
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 23 Oct 2019 11:57:31 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 23 Oct 2019 10:31:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Wed, 23 Oct 2019 11:57:27 +0200
Cc: wang.yi59@zte.com.cn, michal.lkml@markovi.net, nicolas.palix@imag.fr,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        cheng.shengyu@zte.com.cn, zhongshiqi <zhong.shiqi@zte.com.cn>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH] Configuring COCCI parameter as a directory is
	supportted
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

This patch puts a modification in scripts/coccicheck which supports users
in configuring COCCI parameter as a directory to traverse files in
directory. 

Signed-off-by: zhongshiqi <zhong.shiqi@zte.com.cn>
---
 scripts/coccicheck | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index e04d328..a1c4197 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -257,6 +257,10 @@ if [ "$COCCI" = "" ] ; then
     for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' -type f | sort`; do
 	coccinelle $f
     done
+elif [ -d "$COCCI" ] ; then
+    for f in `find $COCCI/ -name '*.cocci' -type f | sort`; do
+	coccinelle $f
+    done
 else
     coccinelle $COCCI
 fi
-- 
2.9.5

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
