Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D977F2D1FF
	for <lists+cocci@lfdr.de>; Wed, 29 May 2019 01:09:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4SN8a1G003633;
	Wed, 29 May 2019 01:08:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D714D776A;
	Wed, 29 May 2019 01:08:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DE12C774E
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 01:08:34 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4SN8Yne007423
 for <cocci@systeme.lip6.fr>; Wed, 29 May 2019 01:08:34 +0200 (CEST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E71620989
 for <cocci@systeme.lip6.fr>; Tue, 28 May 2019 23:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559084913;
 bh=OYywMqTsACw+zwe/Xl7JCIq1FGisTh0csPAs5RTEhcQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h+3xbxhONeXrN4WOdBJXzOzmEUIZG0s9la7M7BCktcDEgFuHg+5XorkEub678F3/+
 Jldcq/nue0MfgXAA04h+RoknaIwpnykIJKtAzZULvsVdBIA9FgWoRSpr+tJBPI/UOB
 PhNp+R5wQQD3AqJKvOcGMY46q1hSe/REULlqgz/w=
Received: by mail-ot1-f41.google.com with SMTP id j49so99362otc.13
 for <cocci@systeme.lip6.fr>; Tue, 28 May 2019 16:08:33 -0700 (PDT)
X-Gm-Message-State: APjAAAVPZqJKWFeOh9scmWIVFQWoSnnJPK/Yxe9sajIaMpwsuMXjJlj4
 hI/X/5ytbE+VYYVtCJWAMJDbFtfi2cB6+kUJwEw=
X-Google-Smtp-Source: APXvYqwxxZzBMleQe/B5z+DZrLChU+WQ83I830tzMx0knoqGTVT64PgPbTvZKZWD/G1x333Uanw2LgR9ILHjKSgTOw0=
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr995647otq.185.1559084912632;
 Tue, 28 May 2019 16:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOZdJXVuNYEkFOiUWYq0GbqRUfuTNV35FGt7EViSSq6AqAY2-A@mail.gmail.com>
 <alpine.DEB.2.21.1905281811270.2487@hadrien>
In-Reply-To: <alpine.DEB.2.21.1905281811270.2487@hadrien>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 28 May 2019 18:07:56 -0500
X-Gmail-Original-Message-ID: <CAOZdJXXZkOQ8wv9TBhRWaeGKeGg1e_Mao_Vi-6jKbvDEK2=ATA@mail.gmail.com>
Message-ID: <CAOZdJXXZkOQ8wv9TBhRWaeGKeGg1e_Mao_Vi-6jKbvDEK2=ATA@mail.gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 01:08:39 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 29 May 2019 01:08:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>, Timur Tabi <timur@kernel.org>
Subject: Re: [Cocci] Controlling where braces are located?
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

On Tue, May 28, 2019 at 5:12 PM Julia Lawall <julia.lawall@lip6.fr> wrote:
>
> Try --smpl-spacing.  You will need to make all the spacing in the semantic
> patch in the way that you want it to appear in the generated code.

I got weird results with that:

+                if (p == NULL)
+{
+                    status = ERROR;
+                    goto func_exit;
+                }

I tried inserting tab characters before the { in my script, but it
didn't do anything.  The { line is flush-left, and the rest of the
lines are indented properly.
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
