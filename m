Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC3532A34C
	for <lists+cocci@lfdr.de>; Tue,  2 Mar 2021 16:08:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122F7OLp013133;
	Tue, 2 Mar 2021 16:07:24 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 88C3B77DF;
	Tue,  2 Mar 2021 16:07:24 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1E1CE5DC3
 for <cocci@systeme.lip6.fr>; Tue,  2 Mar 2021 16:07:23 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122F7M5n024152
 for <cocci@systeme.lip6.fr>; Tue, 2 Mar 2021 16:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614697642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZ2+CiXAnq95erx9FqPUSNSCvvFQGSn29ZecdYN07k8=;
 b=BoNqDAfWawTQoBrdj1MweuzfVkIi6nSZEEYq/GbBlCiHYWEH0J6vIXQIUuIWy6dV7JRc/j
 CeLqK0CM96CyF2iE5p/FANgRk/aWTke2XtdnWYVF2r4Ix7qSS5JdYcMR634a7+T4FIbGdd
 1+gNtCHjKd48fMIs5m08Nw42I1CAzvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-VJtNnZZbPXe5MUbUV46U_g-1; Tue, 02 Mar 2021 10:07:10 -0500
X-MC-Unique: VJtNnZZbPXe5MUbUV46U_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432EC18A225C;
 Tue,  2 Mar 2021 15:07:09 +0000 (UTC)
Received: from localhost (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 861C618996;
 Tue,  2 Mar 2021 15:07:08 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:07:07 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20210302150707.GE26415@redhat.com>
References: <20210302114208.GA1818@redhat.com>
 <alpine.DEB.2.22.394.2103021551510.2906@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2103021551510.2906@hadrien>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 16:07:40 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 16:07:22 +0100 (CET)
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] A few build failures with OCaml 4.12.0
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
X-Spam-Score: 4.047 (****) BAYES_00,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_SOFTFAIL,SPF_SOFTFAIL,URIBL_BLACK
X-Spam-Status: Yes, hits=4.047 required=3
X-Spam-Report: Content analysis details:   (4.0 points, 3.0 required)
                pts rule name              description
               --- ---------              -----------
                5.1 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
                                           [URIs: rwmj.wordpress.com]
               -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                                           [score: 0.0000]
                0.7 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
                0.7 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
                0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                                           mail domains are different
                0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                                           valid
               -1.0 MAILING_LIST_MULTI     Multiple indicators imply a widely-seen list
                                           manager
                0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
               

On Tue, Mar 02, 2021 at 03:52:21PM +0100, Julia Lawall wrote:
> This problem is fixed now in the github version.

Yup, can confirm it now works with git @ 3dc5d027b448

Thanks,

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
