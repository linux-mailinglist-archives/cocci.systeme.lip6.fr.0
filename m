Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBD18C7E6
	for <lists+cocci@lfdr.de>; Fri, 20 Mar 2020 08:04:29 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02K73MBM015227;
	Fri, 20 Mar 2020 08:03:22 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 060157822;
	Fri, 20 Mar 2020 08:03:22 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0670D3B93
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:03:20 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:644])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02K73IOb006824
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:03:19 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id b9so2097353pls.12
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=iqxfyCjDDU9GHupsllSiqFBQ6u04aTjgugzg9TMeOZ/kjmhYzqn2rbrVeFFdEPN3Ng
 pn3Z4NCN1HIk25XJ4iGYUaHy8JWxB6zRy3YD30np3dUyPRRDVD7WT80Rh4IVAY+xoDzR
 nlIC/sP/wEpIvZ8lkWf8wAcO58E3YbSFdCTbEvMMH0Ty1+t/d67hpqVH8ZJkMD+EI+Y9
 e2Gh2iCyJ1sjEbqAgX8oKbBiFfETcBkE+4sSU8HlsGPoQTIFtIiHEwsONjgucEbEoOn6
 O32nqd7pZey8HyN6YaiDpkQJtpaRdWrIQRuM6WYjtSgboHvLQ1ycEy6lGgSdWZFOHzt4
 LSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kd2vYYIgWVNqEV4R66099cZMd/G/FFbUiirYb9tf7F0=;
 b=johBSi8IYWR0QC3O+qpVJ/k9nv5rm1ywMq+WX7Z9Vh95ep+PQ3z3F+q2ztykvSmUht
 NE/ZjcwLrc11OYlk62yMFdfTKNxQn4s3ztE66yeRn61WyZH8pAdw9WsMB0tuMaQdFRdt
 r6n4W/xwjBqty3AWxDlj0fDTNlpcOH6t0daktBcFwMBTFmVaSXBt7rRBkSzdiyTXFjmB
 HEtklrzxkp7TKUFNxeSZunvVyDyMzOCKzGwDvC4GvL5y2VHYep4HxrC2LZUH8mquOuTu
 ATSJF3OG0bVr9UqGqo0Ly+zXlg9DIwn5W3+q7GGfYOCv3lCGjRP9rqw2U4ajLPhTTPnp
 W38w==
X-Gm-Message-State: ANhLgQ21nVO6Te9dDWH0ayKkubsqQNu/NfoYEKQaMz76OpPDOkTTzb1Z
 0LqmNjVBZKO0TGU8WjYJTY5G/h7E
X-Google-Smtp-Source: ADFU+vt+L7fanGnxUNul/gCQdVFTNDVT7RDVsEJ3B0nBYC81lDkYYZOZlgQ+z/tEonCg4651qXcQ2A==
X-Received: by 2002:a17:90b:124a:: with SMTP id
 gx10mr7880740pjb.117.1584687797519; 
 Fri, 20 Mar 2020 00:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:17 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:48 +0530
Message-Id: <20200320070157.4206-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 20 Mar 2020 08:03:22 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 20 Mar 2020 08:03:19 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 17/26] parsing_cocci: type_cocci: Add
	ParenType/FunctionType to types
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
cases for these types in type_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_cocci.mli | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/type_cocci.mli b/parsing_cocci/type_cocci.mli
index c1ccb58f..6f24adf7 100644
--- a/parsing_cocci/type_cocci.mli
+++ b/parsing_cocci/type_cocci.mli
@@ -16,6 +16,8 @@ type typeC =
   | SignedT         of sign * typeC option
   | Pointer         of typeC
   | FunctionPointer of typeC (* only return type *)
+  | ParenType       of typeC (* only return type *)
+  | FunctionType    of typeC (* only return type *)
   | Array           of typeC (* drop size info *)
   | Decimal         of name * name
   | EnumName        of name
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
