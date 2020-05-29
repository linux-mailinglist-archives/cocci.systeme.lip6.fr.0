Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 672151E7CAA
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:09:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC92m1015727;
	Fri, 29 May 2020 14:09:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B65307829;
	Fri, 29 May 2020 14:09:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 60B375D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:01 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:544])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC8xW9022228
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:00 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 124so1406821pgi.9
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cpg5XFXC/HQO82XvoKtnC91SCX9ljDeFNodUPxNe4tw=;
 b=lZdQYIK1cKhaLdhcwdI1k1D/5XUZdEWpfy8kY3vtnbaWdEkC6TIqV2rNEJ0zfqkesM
 dZLZwuDRSvHcsAc4P92Ihx9QbaXkfx7WyLHxWjWHMJvb5rgJewVMkwJHWw5nd3kslHed
 UPAF7WG5dY0A+i7H+Z7Az8F/hygVFOK8B6y2sQ803IlWYgBHFcPGQfyvZp5WQaMnYg0N
 36ONKDVXigwajucfIC3tf5kzdMpp4//0vjfjk/ki+d8Scklb/YbFk5wuRZ05xA3omNvB
 AaGiEuda36+lbyAFUGp0pGtByvYe+66C4EJZkUQPtcv9XFy7hFF8AlmQuxv3XO2Le+dX
 kIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cpg5XFXC/HQO82XvoKtnC91SCX9ljDeFNodUPxNe4tw=;
 b=dscn+CashrLytWo3y80merDA6FQ7QDndn3Q/AgG7ZM/PxK779w0YNZ6z82lZlqg7ZX
 GleYUPaE6TJREkWsua239Lc848/FjigFw7LiUb+/vZgW6gNfX1dzmRT6ObOy0AOQJ6aw
 quhz2UVFWdlQDfIJG4V7zQxvnFItlWISyFIx9OVe2ELBegZvIFp4TSE4OWXocCEFtgMw
 fW9rIEX65qB3qPp/EYG/GEkF8r7HZ9bPApk9VD+D5KWLTNvqD+Plqo55wPIMYuJdYyc+
 1M5v7luuAb9bo5Yz4CPchGNyeICppiJhjhjdQ+bqJok7g4vsL1SDIlOG0nhjabpab2k3
 ntcQ==
X-Gm-Message-State: AOAM532tj8jNGa7b3Z9nzsT6KOuuyLIo4hmuExISht/HW/WpVX7imzeP
 EFs2qLJdSplSV2b32nSF9nfRuZIZ
X-Google-Smtp-Source: ABdhPJxEZhwo1GscAc8LPwTDkIT4nCa6M025kaV16rFjo5ItaEm0cAx+mvH0hW1vvwhkBa3YT3falQ==
X-Received: by 2002:a63:63c4:: with SMTP id x187mr6290234pgb.112.1590754138992; 
 Fri, 29 May 2020 05:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:40 +0530
Message-Id: <20200529120703.31145-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:09:02 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:09:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 10/32] parsing_cocci: check_meta: Reflect Cast
	attributes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Cast attributes are added to the SmPL AST. Reflect these changes in
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 0e7e04e5..9cbb79c5 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -172,7 +172,8 @@ let rec expression context old_metas table minus e =
   | Ast0.RecordPtAccess(exp,ar,field) ->
       expression ID old_metas table minus exp;
       ident FIELD old_metas table minus field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
+      (* No meta attribute yet *)
       typeC old_metas table minus ty; expression ID old_metas table minus exp
   | Ast0.SizeOfExpr(szf,exp) -> expression ID old_metas table minus exp
   | Ast0.SizeOfType(szf,lp,ty,rp) -> typeC old_metas table minus ty
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
