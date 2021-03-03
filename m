Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010132B95F
	for <lists+cocci@lfdr.de>; Wed,  3 Mar 2021 18:07:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 123H6QV3013682;
	Wed, 3 Mar 2021 18:06:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A98A777DF;
	Wed,  3 Mar 2021 18:06:26 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AC0EC571B
 for <cocci@systeme.lip6.fr>; Wed,  3 Mar 2021 18:06:24 +0100 (CET)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:631])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 123H6Nii020050
 for <cocci@systeme.lip6.fr>; Wed, 3 Mar 2021 18:06:23 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id hs11so43642424ejc.1
 for <cocci@systeme.lip6.fr>; Wed, 03 Mar 2021 09:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7H4xfwloy50FY8UV/7fV0qhLMGXpdonkA69zAip1ZGg=;
 b=KXMGQhqwZOMzqaJiSnG7f0i88MMel5zIcVqW7NPgsBremQhSX7mh/bMupaprSCLDg0
 GdQGVjxyawVKCmDqHrSgxkFUR2M8YxYJXm2u/vupD8cAxJ/QVyYAgmBmbo3hn73L485s
 YP3Eh+4GhK96qxra/+ZHIwl5VZkNVQ6j9shb8wO2npw3EP+RStTCbBt2EmezrYCnu10P
 DWSHHmpo2P/KcqSnsAJF1FQmOV8J06ok6+G+DYcyND8N+lWmWfW92MXvK+PercW7Bk9c
 0ZR32DqGqR+T12uF3kNjoooojex5Mtrh4T2xlcU3RtH5pzg3WnrGoCFIMkfzkh6uDmFA
 MLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7H4xfwloy50FY8UV/7fV0qhLMGXpdonkA69zAip1ZGg=;
 b=PDbPlMxuAdk5IBZt/XVT8ZYjWDfNQZfZoEHmYZkRso/Fw39zSRBxdODWrdDqCsK7hD
 Fa1W47bfauDLEC+9CcwE6LI0HJ6NSzcOlD0d4fB20LRQqeIjX6FqKGOkCidnbTlHqbt0
 3PZooAbyPKOlXxvEkzsbXkpKOGVG4lohcPNoeSjBloTdQdK6D0Xr0R7PvfoMaFkQP9Mp
 yBQG1jKhL/NcdHB5Ixra2Z4iE/S1G4z29rHsf7Y5cgMOMk8oy8eVjvb9J5PaW5BxU7Vq
 2Lf65NkS4IixOmm6xalbtto1joOaaIsnoTJ4QerWJCdRxFrn79jSPwTvzBOuPl9sKz9j
 C1Wg==
X-Gm-Message-State: AOAM53307B7prT6VTyjy/zRq5rJu/Y7qs3p3PjwTpXundsCZmZ9S7kvy
 7NYo1KmSp571dYidqdRz7la8hU13NcJJvQbKAEcWPqpUS2SDEw==
X-Google-Smtp-Source: ABdhPJwWm5FZ/d7BJMLCn4BUSsTMDNRmd1Geyv3CbjRaROaAePlNfZvJPQgY1UtmJStp7ZuHiyhcG4CxTz80obdIP9c=
X-Received: by 2002:a17:906:495a:: with SMTP id
 f26mr18885557ejt.271.1614791183230; 
 Wed, 03 Mar 2021 09:06:23 -0800 (PST)
MIME-Version: 1.0
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
In-Reply-To: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
From: Mansour Moufid <mansourmoufid@gmail.com>
Date: Wed, 3 Mar 2021 12:06:12 -0500
Message-ID: <CALogXGVMCiZcMRovK+9gJVKQPDJJdWUuXRPXVZ0fxmAXyq4Uig@mail.gmail.com>
To: Joe Perches <joe@perches.com>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Mar 2021 18:06:42 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 03 Mar 2021 18:06:23 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] linux-kernel janitorial RFP: Mark static arrays as const
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

On Tue, Mar 2, 2021 at 4:22 PM Joe Perches <joe@perches.com> wrote:
>
> Here is a possible opportunity to reduce data usage in the kernel.
>
> $ git grep -P -n '^static\s+(?!const|struct)(?:\w+\s+){1,3}\w+\s*\[\s*\]' drivers/ | \
>   grep -v __initdata | \
>   wc -l
> 3250
>
> Meaning there are ~3000 declarations of arrays with what appears to be
> file static const content that are not marked const.
>
> So there are many static arrays that could be marked const to move the
> compiled object code from data to text minimizing the total amount of
> exposed r/w data.
>
> However, I do not know of a mechanism using coccinelle to determine
> whether or not any of these static declarations are ever modified.

I thought it would be a fun exercise but it got tedious quick.

I don't know how to ignore an attribute like __initdata.

Feel free to refine it:


@@
type t;
identifier x;
@@
(
    static const struct { ... } x[];
|
    static
+   const
    struct { ... } x[];
|
    static const struct s *x[];
|
    static
+   const
    struct s *x[];
|
    static const struct s x[];
|
    static
+   const
    struct s x[];
|
    static const t *x[];
|
    static
+   const
    t *x[];
|
    static const t x[];
|
    static
+   const
    t x[];
)

@@
type t;
identifier s, x, y, z;
assignment operator xx;
@@
(
    static const struct { ... } x[] = { ... };
|
    static
+   const
    struct { ... } x[] = { ... };
|
    static const struct s *x[] = { ... };
|
    static
+   const
    struct s *x[] = { ... };
|
    static const struct s x[] = { ... };
|
    static
+   const
    struct s x[] = { ... };
|
    static const t *x[] = { ... };
|
    static
+   const
    t *x[] = { ... };
|
    static const t x[] = { ... };
|
    static
+   const
    t x[] = { ... };
)
    ... when != x.y xx ...
        when != x[...] xx ...
        when != z = x
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
