Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A165D13E047
	for <lists+cocci@lfdr.de>; Thu, 16 Jan 2020 17:38:36 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GGc2IH014800;
	Thu, 16 Jan 2020 17:38:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 78AD377FF;
	Thu, 16 Jan 2020 17:38:02 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B7FB977E5
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 17:38:00 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GGbrb4023850
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 17:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579192672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=anvZDcZqTtQrdJmh2nD7WOj1chfNUuA3Tc2iTELgcIY=;
 b=fKRIn6Uu302MKE2vGUgADqsqScrIAwlg2OC+NyuYrspQ4d7mUDV6r0r/EY+YGolVgRDINW
 n6DMTjx8EhcZFEmx0YA8zq7xSwnwzWoKim2xdctr5Z+EIKYvU7PIQdkl55fWfpE1FjWidV
 pU633knm4TQvUikYWyI3uiXwqtDqMO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-B2cKuKtNPoi3CTF7xuIicg-1; Thu, 16 Jan 2020 11:37:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819CD8010D4
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 16:37:49 +0000 (UTC)
Received: from localhost (ovpn-117-237.ams2.redhat.com [10.36.117.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD5E81202
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 16:37:48 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:37:47 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: cocci@systeme.lip6.fr
Message-ID: <20200116163747.GA1762@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: B2cKuKtNPoi3CTF7xuIicg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 17:38:04 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 17:37:55 +0100 (CET)
Subject: [Cocci] FYI failures reported with Python 3.9 with PyImport_Cleanup
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


https://bugzilla.redhat.com/show_bug.cgi?id=1791765

  Py.find_library: unable to find the Python library [/lib64/libpython3.9.so.1.0 returned Cannot resolve PyImport_Cleanup.

The documentation for this function says:

  void PyImport_Cleanup()
  Empty the module table. For internal use only.

I guess that is code for "don't use this function" :-)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
