Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE71BC60A
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH3TPn013073;
	Tue, 28 Apr 2020 19:03:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8E776782D;
	Tue, 28 Apr 2020 19:03:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EB01C3DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:26 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1041])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH3Ocl007420
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:25 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id h12so1287202pjz.1
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ya/wxKSqb2SwN0YcwXa6DDweA8dU0H84ms/FmoW8w/8=;
 b=ciAxJqGap2Gfw4XqoDGw8Xm0xjnvvpr2TkfRyuj4k9co9w+iGCesptcDlY0AA530Hd
 uzHNEqGUG8t6afjjjWMJS2bVFY+tM2fb2vcfvmeWbPrUCyXbPMsphIoug17tjuqxYtzZ
 tMhiIX9F7eUBRkyJFWNvLVEzwYb9ImZ3RF2OxETQtLYtLaVXZ8Mb/vK7p37zA0wJdxng
 o4rZvZHBIyz6SZXMwHv4AxDavOHjLr2Q0Jp8oVhu6Py3bq0KP01WR9ii4Q40RKZEF7XU
 FB4kEwdmmouQC+d2JwSRt0y49AAFWMbKqHHV37GjCdwB3ZL9wwwiUNbxBpbekdZkescb
 VqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ya/wxKSqb2SwN0YcwXa6DDweA8dU0H84ms/FmoW8w/8=;
 b=YsfaSffC1wvfMVSFtFPFXIYhwbCSs4VbgcFSYax8YlbsYZI+9acr8iIHQqbDsj1Atn
 QRbSK4J1o1EKM7WBNdnWhD8PsD/lhLcKVo9j/cxU1xaUC/bKdo4LTmviiZ6wnSPDR+W4
 LzdbUPjtCt76qgJAS+nnyt99MoyMglGtrfnJtBPLIF4/OdrYQR4LM0l8T+YHAyT2YjyN
 wXg1jbViS5J15YC5eLjxyv+vSvcw4PWS8fPaFGYTPwaXZES9rTjisvm99ywflY8o0o9w
 jlpzfAhpcZpSJlw9mTixPj8LREbXIzWc5NVxrlB2k98IrfPwjQsR1StH+hT6XkIQ8sSM
 Rwuw==
X-Gm-Message-State: AGi0Puby+Ie2XxkcVU96e/KLRtUVagX3LqxkcYlpwiezk3nhw90eLGsz
 u6NxCHdGXd9Lt6fWuin6jsSNdjBK1Bg=
X-Google-Smtp-Source: APiQypLo2JcMy/Df4oIXcS76rGPjFRgY7+gbrmqvWvmjSjSkNSpA8jShc+CZQwcNUuf2gvgy75enbA==
X-Received: by 2002:a17:902:b097:: with SMTP id
 p23mr29727841plr.263.1588093404032; 
 Tue, 28 Apr 2020 10:03:24 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:22 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:06 +0530
Message-Id: <20200428170228.7002-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:03:29 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:03:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 10/32] parsing_cocci: check_meta: Reflect Cast
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
index 5a348ba3..4f7db813 100644
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
