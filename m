Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D102E5A5
	for <lists+cocci@lfdr.de>; Wed, 29 May 2019 21:58:52 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4TJwJZB012783;
	Wed, 29 May 2019 21:58:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3C92F776C;
	Wed, 29 May 2019 21:58:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 61D5A7756
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 21:58:17 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4TJwGti014303
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 21:58:16 +0200 (CEST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28E0B2410F
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559159896;
 bh=n947Knhuy7gGZ4it3c1MOfmnrIqL09cVoR9/ueBO6+I=;
 h=From:Date:Subject:To:From;
 b=03AkKuxf4etgcITdeuqgComGKKIGxbcgUX7t+zMhZg0bl+k1WAESkGyzCsCzvn7eU
 hRobxJpHAYLjKjSOmX6DTxPGwF3P0nqi4wjPffAQTCfb6R9k6Xhtb2XvI2nd9RNsYx
 QFmkZ6Jm21LdbNLWICmWvz5M9dre+uVh2HHLcx1w=
Received: by mail-oi1-f182.google.com with SMTP id u64so3137257oib.1
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 12:58:16 -0700 (PDT)
X-Gm-Message-State: APjAAAUT7hv7MgMsl7N1dhR4Y5nDSdObpC7L5KEsJ/Ln2EKxiHblgr0S
 Eh5WfSh9SZ0zGR2n/lWUgkA3Mf0LUWPPrU9AkKw=
X-Google-Smtp-Source: APXvYqwhEsrx53NSK9PxaFsN0pq2a4cSkPrZqQb7LIXFAbgfHhLvfVsuSsRDkmlJPDJSEpUeoMN5a/enRm3QVAOMDUc=
X-Received: by 2002:a54:4f98:: with SMTP id g24mr3501oiy.99.1559159895475;
 Wed, 29 May 2019 12:58:15 -0700 (PDT)
MIME-Version: 1.0
From: Timur Tabi <timur@kernel.org>
Date: Wed, 29 May 2019 14:57:38 -0500
X-Gmail-Original-Message-ID: <CAOZdJXUO7vMoJRZ5-3E2cRiiO_m60p2xdkurQspS-TF7O_cCPQ@mail.gmail.com>
Message-ID: <CAOZdJXUO7vMoJRZ5-3E2cRiiO_m60p2xdkurQspS-TF7O_cCPQ@mail.gmail.com>
To: cocci <cocci@systeme.lip6.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 21:58:19 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 21:58:17 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] How does the "when" statement work?
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

I have a feeling that I can use the "when" statement for what I'm
trying to do in Coccinelle, but I can't figure out how it works.  I
can't find in the documentation where "when" is actually explained.
It appears that it's supposed to be documented here:

http://coccinelle.lip6.fr/docs/main_grammar005.html#when_code

but it isn't.
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
