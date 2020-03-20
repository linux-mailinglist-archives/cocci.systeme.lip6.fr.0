Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1618C7E3
	for <lists+cocci@lfdr.de>; Fri, 20 Mar 2020 08:04:20 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02K7320A022396;
	Fri, 20 Mar 2020 08:03:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D003C7822;
	Fri, 20 Mar 2020 08:03:02 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8421A3B93
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:03:00 +0100 (CET)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:643])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02K72wif011892
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:02:59 +0100 (CET)
Received: by mail-pl1-x643.google.com with SMTP id f8so2100427plt.10
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tQzzSzGwOrXNCobyy8rVLQ7w9jC7U4oHB4x0KSxfhk=;
 b=t1tzX79I4XZXrK+Si0+scQzEXnTKub/Wi6LnQXwjlbfbTYHrPnK8jv7hchWTOzbqOl
 MdlPVPWnk7ez2JE/Gs2DNFQwvUa8/TbXc7jcQ3bogWQoEyb2gaYpznLgTyovdRvBS5iw
 Sg93bx14nSUkMuBrDvtuLC9EkC/Y/FwfqG6iizbGAr91E5xtps7RFQNTh05kvYqeiBbG
 uxeYhH+kwoxeSxxUgue5xdQO43Ap8MKUmY19DoAG5b8SyXMAQ8LFiG7D0hlw1vikGrqZ
 3iUbwFBl5wS8ngs+mRjMrAmmB2jyYtwBkBjUo3slXAUS1kl41XTxNpESl749lPKbpvxA
 FqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tQzzSzGwOrXNCobyy8rVLQ7w9jC7U4oHB4x0KSxfhk=;
 b=ucjGP3QE5P/8D2zqBdt9/LnsORCBRoC2N0VXURnKIKtIbTr6KGbr43gG/TkX5vEqWv
 Ii8wnIk1FJmHJLPNtcs+E6H/RUiE5obU1Fy2Iw9nVHjr2zLHMfK9w5hyQNNKNq55wlmc
 oLrJiFw/A7kPxLgB4otx1PhjK2LM2MiGqX5gktxh1bY7ZZotISZkCl5qAvidebQ4CB4J
 SsL3i3IUAaYBEJxzn0d7EP6ZvpgziUK55KDt1PlW2Av1TXhysb57xRpLI4Giz8s6Mnxg
 H5Zmxfkm6IqmtaQZ1lSOOSGg2WEZygiOT0k8b5o8MS06qDtixbvI97fYFp+c4JYjfyqt
 m9gQ==
X-Gm-Message-State: ANhLgQ381SPzwNABSke7nAaKZJfltwDHj1EXxgpg52gOfoo9sGFPqaNp
 /VvCoPihceLJX88vaCkoO5NnuAxk
X-Google-Smtp-Source: ADFU+vsWz6vCf0XBfkU7AU/9lFtGh62al8ZLN9te+abgJTFdnuAN6NnDNOeI90oY0KiDGekl0OEzCg==
X-Received: by 2002:a17:902:b907:: with SMTP id
 bf7mr7221111plb.3.1584687778085; 
 Fri, 20 Mar 2020 00:02:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:43 +0530
Message-Id: <20200320070157.4206-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 20 Mar 2020 08:03:02 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 20 Mar 2020 08:03:00 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 12/26] parsing_cocci: check_meta: Add cases for
	ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 02b0fd9c..7b10bd53 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -224,6 +224,11 @@ and typeC old_metas table minus t =
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
       typeC old_metas table minus ty;
       parameter_list old_metas table minus params
+  | Ast0.ParenType(lp,ty,rp) ->
+      typeC old_metas table minus ty
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      typeC old_metas table minus ty;
+      parameter_list old_metas table minus params
   | Ast0.Array(ty,lb,size,rb) ->
       typeC old_metas table minus ty;
       get_opt (expression ID old_metas table minus) size
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
