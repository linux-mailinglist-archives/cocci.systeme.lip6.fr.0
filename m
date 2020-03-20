Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398B18C7EE
	for <lists+cocci@lfdr.de>; Fri, 20 Mar 2020 08:04:54 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02K73qEq007121;
	Fri, 20 Mar 2020 08:03:52 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6B25F7822;
	Fri, 20 Mar 2020 08:03:52 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EFC473B93
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:03:50 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:444])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02K73nvk001414
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 08:03:50 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id b72so2738876pfb.11
 for <cocci@systeme.lip6.fr>; Fri, 20 Mar 2020 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=gQyCa8cAnE8Qw5wKqASTu5aaqAQWCZW4pNEi6aFOyYKw9ojGtiP8JSvZSv1+BVpItc
 5QIuUmj101VnAvbqaftKXGUq1vWPJMeFT5M4hLc3uewNrJz6Yki9phS321MbYdkxMbtc
 8UxvY5dnqUcHPvCg0BxAIctMqVt3xH0/qtAxWx0mAoz81NVR3sQTj7LeQKF2rGfNdtBf
 20dhiWjQZp53r1EduQYQvHYRXSR2fU0G8/63YisbjKB97kStKwOWCdW25HLeJkdoZFLv
 R80oy9pgwc3DUFylM3UwubP0aUfvw55B6hPVtsnvilqEZZu721GjqzaBomh4hEnAKvGX
 uVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=lS1U+1iyk74R0XRPfOTBAZ78BbKT4dsI8FLePJw02JR0mzcrJNo4Ils52zNcnPvfMc
 N5p2BGVjvRU6w+zq5VwHI0ykc54cGiUh/Axx7jG3syI+6VJP3rL9OMOSvWKMROddMak2
 uokXDXwIqTe/2b//dFvTy6vmsRhzLpXTndxIQjRp/shZFaYOAkV701ib3641R3QZPb/D
 py7u3auK91ay8NjYcwzG038uxEe9rhTMC90a5cwYz1pe1hal9lgLCj9SrQyp/dXGpsSa
 QphzDSeWdB3jG1AznHAJyUgOzm5CpYbJf1DZ0sy8+mirujTK3huNcxkeMeb4p6dldLXr
 IOZg==
X-Gm-Message-State: ANhLgQ1slM2OxeLaIp30/bykVi1vj+LFhJpGfHvVFWi+yxQGLRUpA7yy
 w+T6/+BSG4pwwGFqTPFjv6PWDEQk
X-Google-Smtp-Source: ADFU+vvvprRZnhyJod09oJ8a0jAyFf6SWu4Pr9FYtAyMUqJa28qxauEp9416qlq6GwJ56oNutYMBqg==
X-Received: by 2002:a62:14d7:: with SMTP id 206mr7729914pfu.43.1584687828540; 
 Fri, 20 Mar 2020 00:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:55 +0530
Message-Id: <20200320070157.4206-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 20 Mar 2020 08:03:52 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 20 Mar 2020 08:03:50 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 24/26] tools: spgen: Add cases for
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
cases for these types in position_generator.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 31d6cb5e..2fa630fb 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -195,6 +195,12 @@ let rec type_pos t snp
   | Ast0.FunctionPointer(t,lp,star,rp,lp2,params,rp2) ->
       let constructor ~mc = Ast0.FunctionPointer(t,lp,star,rp,lp2,params,mc) in
       mcode_wrap ~mc:rp2 ~constructor snp
+  | Ast0.ParenType(lp,t,rp) ->
+      let constructor ~mc = Ast0.ParenType(lp,t,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
+  | Ast0.FunctionType(t,lp,params,rp) ->
+      let constructor ~mc = Ast0.FunctionType(t,lp,params,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
   | Ast0.Array(t,lb,expr,rb) ->
       let constructor ~mc = Ast0.Array(t,lb,expr,mc) in
       mcode_wrap ~mc:rb ~constructor snp
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
