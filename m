Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B881BC606
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH3JBr006512;
	Tue, 28 Apr 2020 19:03:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BEBEE3DC8;
	Tue, 28 Apr 2020 19:03:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E6B123DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:17 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:443])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH3GET000062
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:03:17 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 145so10951977pfw.13
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=OhnAGeaRr2PjwZ2hnruAV4cb1nbd464BlGzGbPu2Zza8GqQ/X91Xt8k/EBOqmK2Upy
 zkC9KBXX6BAn+3zSsu5SaYSjk53/BOIPI3IfcqgbnZaQTrk+J01hzKa5u9k1pbIrdTE8
 ArdXMF/v9Jaa1HpPqIY/7mKkEvDD+XRC7LU+tJiuy4j+RNw1iOmZUyKkQij+Q7C6/kr6
 Ul0u4hGFL1HlLcelQwYP6uNbPbPv/eCNIGyzJE9H0Bl/FuPhepirV+AsOuBHc013dz3G
 WSBJ8obaL6ZhMxj+b/5PnUVpA5reXa7h7ottwag0GM6S0UPusQ8abTUaUPQGl3cjDRls
 Pxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=CchqYVDlgtrXb6uqWftr0qFAorZp8ZF2KdyknF+fjv9+RxVhnHrzIEIPJup2QVLukh
 l5P437sIhLcZuKpj/haFFNh/OVryA7fhkSKgE56Hb+Nu8LXAnMffY6zs6DWMVpDPjkQz
 7e+mDT1q1CqqxSyGTqHf8njidRg7RLg2zOdXPspYL13UhlxVJ72QVJ2UNjMA7csu3UKI
 jYdabRV+6k85NPkV1l9xuir6yS3L534Mg9OI7dY/BF1HVMyXJu4wgsQb2DDKPvrEWmyj
 RP6ekrLfB6vmG7cW31H+Is4ZnrIZB2IdtyfwjHaoQabeGallCyaDgSfJjA7Ve+iyNOxY
 88lQ==
X-Gm-Message-State: AGi0PuaWJiH1DU2jgyMTa/3Af1whWl5wzG+NpWftBzs/znlA4VCPD2xD
 IOtqL5WLiFUyrZSi2y0aKOjjqqaZWUw=
X-Google-Smtp-Source: APiQypKoCtEpZnOmzraFt+6Lrp0QhjjlvTBvVMtyUxjZIb5Skhybxoa2p6z09JOqvFiit9tv7kodOA==
X-Received: by 2002:a62:5ac2:: with SMTP id
 o185mr30482649pfb.148.1588093395570; 
 Tue, 28 Apr 2020 10:03:15 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:04 +0530
Message-Id: <20200428170228.7002-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:03:19 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:03:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 08/32] parsing_cocci: type_infer: Reflect Cast
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
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..2c1cc73b 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -291,7 +291,7 @@ let rec propagate_types env =
                | Some x ->
                    let ty = Ast0.wrap x in
                    err exp ty "non-structure pointer type in field ref")
-	| Ast0.Cast(lp,ty,rp,exp) -> Some ty
+	| Ast0.Cast(lp,ty,attr,rp,exp) -> Some ty
 	| Ast0.SizeOfExpr(szf,exp) -> Some (Ast0.wrap int_type)
 	| Ast0.SizeOfType(szf,lp,ty,rp) -> Some (Ast0.wrap int_type)
 	| Ast0.TypeExp(ty) -> None
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
