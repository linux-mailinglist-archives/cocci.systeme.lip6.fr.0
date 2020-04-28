Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9E1BC60F
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH3V7A021381;
	Tue, 28 Apr 2020 19:03:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 076347831;
	Tue, 28 Apr 2020 19:03:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A0DE73DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:29 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1044])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH3RJi026895
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:28 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id e6so1420055pjt.4
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=bbGb5ctzyyjnU5zF0n7nik61jW67Nq7rYY7opWEujDztPnaoWJgtN5wL3ip1FLrsJq
 Q0X/FP7PA3V4b5gGk6QNUI/ivRR0jmoh42PkxSfo1AyyXj4gAcHzCmG7Fzd+JGmkUHkx
 ZyapJlWSoSFVYlMsSHqQb32cRlUyWdXFEnMCicHmOG1hw9ka8rHcWDYUE5keiZqqz/li
 dks2iKRWJ5J+wCrr2COh+B5PQzBa6dmz22KfDABSqtOCKLq70PpJTCOuMZ11wtXADwbk
 60rNVQ5cOvLGD2P4tVQhkfxDcRxnqxpziejKtz9GgbTiU+1N5IeDfd1fD8Sm1XUIB32A
 51HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hng7/Ni+h9OoD4yErxJiv2mDpyB/SRBbLSaLYVxbSB4=;
 b=YFuzJSowRoij7zIy3O3BDf5MF0agmPoJe86jpNQ1BFSbV39kH0unrNA6eoa5o744WD
 Ejkkh4vNdv6TV8RJ+YUY4LrVdd2JB0cQjBfF9ponF39XIgj2bqADN/iwUnk+a+MyMrHz
 f6DJjPhL7uFodfWdXtTQkBP3BnfTdwXS7T2zyg+DdugJ06ww9bpuAcIGZ1R5gHq0GY+c
 r8eeBkq8yfMjpiiIPhtXvzroI0W+id7CQcK9rFY0vLceMgDfztKw6gjcuCPs+fLaOwQQ
 jhstxdQlPeNVwCbn8v9r+rlNrOM6NKsKcOsNNpttzdQ18gNo41A6p+UPkhF/FCNtTRZf
 V7Bg==
X-Gm-Message-State: AGi0PubXut8SRzpkVTmURESF2Lt9pUibKHUfyF1C8+vYpARgLN4CiQGO
 5uEw3laZIoZACSLIdqZdL7913/ag1Kg=
X-Google-Smtp-Source: APiQypIdQYKGQND0Zg442MpY+WqCPCpNVdXZwF2ItJYbTcyuWCjpG4ggtB2TD4asXLF3ttfmk1h25w==
X-Received: by 2002:a17:902:690b:: with SMTP id
 j11mr30676924plk.236.1588093407275; 
 Tue, 28 Apr 2020 10:03:27 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:26 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:07 +0530
Message-Id: <20200428170228.7002-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:03:31 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:03:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 11/32] parsing_cocci: compute_lines: Reflect Cast
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
compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 1361d842..e945914b 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -425,11 +425,12 @@ let rec expression e =
       let ar = normal_mcode ar in
       let field = ident field in
       mkres e (Ast0.RecordPtAccess(exp,ar,field)) exp field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
       let lp = normal_mcode lp in
       let exp = expression exp in
+      let attr = List.map normal_mcode attr in
       let rp = normal_mcode rp in
-      mkres e (Ast0.Cast(lp,typeC ty,rp,exp)) (promote_mcode lp) exp
+      mkres e (Ast0.Cast(lp,typeC ty,attr,rp,exp)) (promote_mcode lp) exp
   | Ast0.SizeOfExpr(szf,exp) ->
       let szf = normal_mcode szf in
       let exp = expression exp in
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
